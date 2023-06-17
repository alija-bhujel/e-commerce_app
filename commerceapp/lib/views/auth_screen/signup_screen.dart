import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/controllers/auth_controller.dart';
import 'package:commerceapp/views/home_screen/home.dart';

import '../../all widgets/all_button.dart';
import '../../all widgets/app_logowidget.dart';
import '../../all widgets/bg_widget.dart';
import '../../all widgets/custom_textfield.dart';
import '../../consts/lists.dart';
import 'package:get/get.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  bool? isCheck = false; // by default
  var controller = Get.put(AuthController());

  //textControllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  "Join our $appname"
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
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          // isPass: false
                        ),
                        CustomTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,
                          // isPass: false
                        ),
                        CustomTextField(
                          hint: passwordhint,
                          title: password,
                          controller: passwordController,
                          // isPass: true
                        ),
                        CustomTextField(
                          hint: passwordhint,
                          title: retypepass,
                          controller: passwordRetypeController,
                          // isPass: true
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: forgetpass.text.color(redColor).make())),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck,
                                onChanged: (newValue) {
                                  setState(() {
                                    isCheck = newValue;
                                  });
                                }),
                            7.widthBox,
                            Expanded(
                              child: RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                        fontFamily: bold, color: fontGrey)),
                                TextSpan(
                                    text: termsandCond,
                                    style: TextStyle(
                                        fontFamily: bold, color: redColor)),
                                TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                        fontFamily: bold, color: fontGrey)),
                                TextSpan(
                                    text: privacypolicy,
                                    style: TextStyle(
                                        fontFamily: bold, color: redColor))
                              ])),
                            ),
                          ],
                        ),
                        5.heightBox,
                        controller.isLoading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              )
                            : allbutton(
                                color:
                                    isCheck == true ? lightgolden : lightGrey,
                                title: signup,
                                textcolor: whiteColor,
                                onpress: () async {
                                  if (isCheck != false) {
                                    controller.isLoading(true);
                                    try {
                                      await controller
                                          .signupMethod(
                                              context: context,
                                              email: emailController.text,
                                              password: passwordController.text)
                                          .then((value) {
                                        return controller.storeUserdata(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text);
                                      }).then((value) {
                                        VxToast.show(context, msg: loggedin);
                                        Get.offAll(() => Home());
                                      });
                                    } catch (e) {
                                      auth.signOut();
                                      VxToast.show(context, msg: e.toString());
                                      controller.isLoading(false);
                                    }
                                  }
                                }).box.width(context.screenWidth - 50).make(),
                        7.heightBox,
                        //we use here gesture detector of velocity_x to go back to login button
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: alreadyhaveanAccount,
                              style:
                                  TextStyle(color: fontGrey, fontFamily: bold)),
                          TextSpan(
                              text: login,
                              style: TextStyle(
                                  color: lightgolden, fontFamily: bold))
                        ])).onTap(() {
                          Get.back();
                        })
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
