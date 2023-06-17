import 'package:commerceapp/all%20widgets/bg_widget.dart';
import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/views/category_screen/itemsdetails.dart';
import 'package:get/get.dart';

class CategoryDetails_Screen extends StatelessWidget {
  final String? title;
  const CategoryDetails_Screen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .color(darkFontGrey)
                        .size(12)
                        .makeCentered()
                        .box
                        .rounded
                        .white
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        "Laptop 4GB/16GB".text.color(darkFontGrey).make(),
                        5.heightBox,
                        "\$500".text.color(redColor).size(16).make()
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .outerShadow
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .padding(const EdgeInsets.all(12))
                        .make()
                        .onTap(() {
                      Get.to(() => const ItemDetails(title: "Dummy Item"));
                    });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
