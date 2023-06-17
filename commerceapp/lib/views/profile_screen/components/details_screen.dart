import 'package:commerceapp/consts/consts.dart';

Widget details_Screen({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.color(darkFontGrey).size(16).make(),
      5.heightBox,
      "in your Cart".text.make()
    ],
  ).box.white.rounded.width(width).padding(EdgeInsets.all(4)).height(80).make();
}
