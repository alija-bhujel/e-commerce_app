import 'package:commerceapp/all%20widgets/all_button.dart';
import 'package:commerceapp/all%20widgets/app_logowidget.dart';
import 'package:commerceapp/all%20widgets/bg_widget.dart';
import 'package:commerceapp/all%20widgets/custom_textfield.dart';
import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/consts/lists.dart';
import 'package:commerceapp/controllers/auth_controller.dart';
import 'package:commerceapp/views/auth_screen/signup_screen.dart';
import 'package:commerceapp/views/home_screen/home.dart';

import 'package:get/get.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset:
                false, // this is used  to remove error bottom overflow when click on email
            body: Center(
              child: Column(
                children: [
                  (context.screenWidth * 0.1).heightBox,
                  applogoWidget(),
                  10.heightBox,
                  "Log into $appname"
                      .text
                      .fontFamily(semibold)
                      .white
                      .size(22)
                      .make(),
                  25.heightBox,
                  Obx(
                    () => Column(
                      children: [
                        CustomTextField(
                            hint: emailHint,
                            title: email,
                            controller: controller.emailController),
                        CustomTextField(
                            hint: passwordhint,
                            title: password,
                            controller: controller.passwordController),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: forgetpass.text.color(redColor).make())),
                        controller.isLoading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              )
                            : allbutton(
                                title: login,
                                textcolor: whiteColor,
                                onpress: () async {
                                  controller.isLoading(true);
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context, msg: loggedin);
                                      Get.offAll(() => Home());
                                    } else {
                                      controller.isLoading(false);
                                    }
                                  });
                                }).box.width(context.screenWidth - 50).make(),
                        7.heightBox,
                        createNewaccount.text.color(fontGrey).make(),
                        7.heightBox,
                        allbutton(
                            color: lightgolden,
                            title: signup,
                            textcolor: whiteColor,
                            onpress: () {
                              Get.to(() => const SignUp_Screen());
                            }).box.width(context.screenWidth - 50).make(),
                        7.heightBox,
                        loginwith.text.color(fontGrey).make(),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: lightGrey,
                                      child: Image.asset(
                                        SocialIconList[index],
                                        width: 30,
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(EdgeInsets.all(16))
                        .width(context.screenWidth - 70)
                        .shadowSm
                        .make(),
                  )
                ],
              ),
            )));
  }
}
