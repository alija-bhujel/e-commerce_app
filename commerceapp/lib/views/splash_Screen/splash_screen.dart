import 'package:commerceapp/all%20widgets/app_logowidget.dart';
import 'package:commerceapp/consts/colors.dart';
import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/consts/images.dart';
import 'package:commerceapp/views/auth_screen/login_screen.dart';
import 'package:commerceapp/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  //using a method to change the screen to loginscreen so make function
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //we are using get_x so,
      // auth.authStateChanges().listen((User? user) {
      // if (user == null && mounted) {
      Get.to(() => Login_Screen());
      // } else {
      // Get.to(() => Home());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: golden,
      body: Center(
          child: Column(
        children: [
          applogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          5.heightBox,
          appversion.text.white.make(),
          // SizedBox(
          //   height: 50,
          // ),
          const Spacer(),
          credits.text.white.fontFamily(semibold).size(22).make(),
          20.heightBox
        ],
      )),
    );
  }
}
