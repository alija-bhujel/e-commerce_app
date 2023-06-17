import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/views/splash_Screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all the widgets run before
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //we are using get_x so we change material app to getmaterial app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              // to set icons appbar color
              iconTheme: IconThemeData(color: darkFontGrey),
              backgroundColor: Colors.transparent,
              elevation: 0.0),
          fontFamily: regular),
      home: const Splash_Screen(),
    );
  }
}
