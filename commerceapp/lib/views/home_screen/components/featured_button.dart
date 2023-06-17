import 'package:commerceapp/consts/consts.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 40,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .width(200)
      .roundedSM
      .padding(EdgeInsets.all(4))
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .outerShadowSm
      .make();
}
