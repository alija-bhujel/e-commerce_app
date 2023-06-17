import 'package:commerceapp/consts/consts.dart';

Widget applogoWidget() {
  //Using VelocityX here we can do this with the use of container but we use velocityx for make code short and easy

  return Image.asset(icAppLogo)
      .box
      .white
      .size(80, 80)
      .margin(const EdgeInsets.only(top: 100))
      .padding(const EdgeInsets.all(7))
      .rounded
      .make();
}
