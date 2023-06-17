import 'package:commerceapp/all%20widgets/bg_widget.dart';
import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/consts/lists.dart';
import 'package:commerceapp/views/category_screen/categorydetails_screen.dart';
import 'package:get/get.dart';

class Category_Screen extends StatelessWidget {
  const Category_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amberAccent,
        title: categories.text.white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 300),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoriesImages[index],
                    height: 150,
                    width: 250,
                    fit: BoxFit.fill,
                  ),
                  40.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make()
                ],
              )
                  .box
                  .white
                  .roundedSM
                  .clip(Clip.antiAlias)
                  .outerShadow
                  .make()
                  .onTap(() {
                Get.to(
                    () => CategoryDetails_Screen(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
