import 'package:flutter/material.dart';
import 'package:newapp/model/catalog.dart';
import 'package:newapp/widgets/add_to_cart.dart';
import 'package:newapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  HomeDetailPage(this.catalog);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog),
          ],
        ).p12(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: catalog.name.text.bold
                  .color(MyTheme.darkBluish)
                  .makeCentered()
                  .pOnly(right: 40),
            ),
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).h40(context),
            ),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30.0,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBluish)
                            .bold
                            .maxLines(1)
                            .make(),
                        4.heightBox,
                        catalog.desc.text.xl
                            .color(Colors.grey)
                            .maxLines(1)
                            .center
                            .make(),
                        4.heightBox,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                            .text
                            .center
                            .bold
                            .xs
                            .color(MyTheme.darkBluish)
                            .make(),
                      ],
                    ).p64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
