import 'package:commerceapp/consts/consts.dart';

Widget allbutton({onpress, String? title, color, textcolor}) {
  return ElevatedButton(
    style:
        ElevatedButton.styleFrom(primary: color, padding: EdgeInsets.all(12)),
    onPressed: onpress,
    child: title?.text.color(textcolor).fontFamily(bold).make(),
  );
}
