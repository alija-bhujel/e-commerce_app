import 'package:commerceapp/consts/consts.dart';

Widget CustomTextField({
  String? title,
  String? hint,
  controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontFamily(semibold).color(golden).make(),
      5.heightBox,
      TextFormField(
        // obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintStyle:
                const TextStyle(fontFamily: semibold, color: textfieldGrey),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: golden))),
      ),
      5.heightBox
    ],
  );
}
