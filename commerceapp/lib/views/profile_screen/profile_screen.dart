import 'package:commerceapp/all%20widgets/bg_widget.dart';
import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/consts/lists.dart';
import 'package:commerceapp/controllers/auth_controller.dart';
import 'package:commerceapp/views/auth_screen/login_screen.dart';
import 'package:commerceapp/views/profile_screen/components/details_screen.dart';
import 'package:get/get.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      // resizeToAvoidBottomInset: false,
      //Safearea is used to not to be place in appbar section
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  )).onTap(() {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 80,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  20.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Alija Bhujel".text.white.make(),
                      "alijabhujel111@gmail.com".text.white.make()
                    ],
                  ),
                  20.widthBox,
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: whiteColor)),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutmethod();
                        Get.offAll(() => Login_Screen());
                      },
                      child: "Log out".text.white.make())
                ],
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                details_Screen(
                    count: "00",
                    title: "in your cart",
                    width: context.screenWidth / 3.4),
                details_Screen(
                    count: "32",
                    title: "in your wishList",
                    width: context.screenWidth / 3.4),
                details_Screen(
                    count: "100",
                    title: "your Orders",
                    width: context.screenWidth / 3.4),
              ],
            ),
            10.heightBox,
            ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: Image.asset(
                            profileButtonsIcons[index],
                            width: 22,
                          ),
                          title: profileButtonslist[index].text.make());
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonslist.length)
                .box
                .rounded
                .white
                .margin(const EdgeInsets.all(12))
                .padding(const EdgeInsets.symmetric(horizontal: 16))
                .shadowSm
                .make()
                .box
                .color(Colors.amberAccent)
                .make()
          ],
        ),
      ),
    ));
  }
}
