import 'package:commerceapp/all%20widgets/all_button.dart';
import 'package:commerceapp/consts/consts.dart';
import 'package:commerceapp/consts/lists.dart';

import '../home_screen/components/featured_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        itemCount: 3,
                        height: 350,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    title!.text.size(16).color(darkFontGrey).make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000".text.size(15).make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.color(whiteColor).make(),
                              5.heightBox,
                              "In House Brands ".text.color(darkFontGrey).make()
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(70)
                        .roundedSM
                        .color(textfieldGrey)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color:".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 6))
                                      .make()),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        //quantity Row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity:".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                                "0".text.color(darkFontGrey).make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)".text.color(textfieldGrey).make()
                              ],
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        //third row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total Price:"
                                  .text
                                  .color(textfieldGrey)
                                  .make(),
                            ),
                            "\$0.00".text.color(redColor).size(16).make()
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                    //Description Section
                    10.heightBox,
                    "Description".text.color(darkFontGrey).make(),
                    10.heightBox,
                    "This is a dummy item and some description about it"
                        .text
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    //List view Section
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonList.length,
                          (index) => ListTile(
                                title: "${itemDetailsButtonList[index]}"
                                    .text
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward),
                              )),
                    ),
                    10.heightBox,
                    //products you may like section
                    productYoumaylike.text.color(darkFontGrey).make(),
                    10.heightBox,
                    //from home screen
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                        6,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            5.heightBox,
                            "Laptop 4GB/16GB".text.color(darkFontGrey).make(),
                            5.heightBox,
                            "\$500".text.color(redColor).size(16).make()
                          ],
                        )
                            .box
                            .white
                            .rounded
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .padding(const EdgeInsets.all(8))
                            .make(),
                      )),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: allbutton(
                  textcolor: whiteColor,
                  title: "Add to Cart",
                  color: golden,
                  onpress: () {}),
            )
          ],
        ),
      ),
    );
  }
}
