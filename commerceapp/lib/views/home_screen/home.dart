import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/controllers/home_controller.dart';
import 'package:commerceapp/views/Cart_screen/cart_screen.dart';
import 'package:commerceapp/views/category_screen/category_screen.dart';
import 'package:commerceapp/views/home_screen/home_screen.dart';
import 'package:commerceapp/views/profile_screen/profile_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // calling homecontroller here for controller the items
    var controller = Get.put(HomeController());
    //for making three  bottom navigate item firstly make list of it
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account)
    ];
    var navBody = [
      Home_Screen(),
      Category_Screen(),
      Cart_Screen(),
      Profile_Screen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavindex.value)))
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: controller.currentNavindex.value,
          selectedItemColor: golden,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          // this is used when we tap to the given items then it clicked on it and color changes.
          onTap: ((value) {
            controller.currentNavindex.value = value;
          }))),
    );
  }
}
