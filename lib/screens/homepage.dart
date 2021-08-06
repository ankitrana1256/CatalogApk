import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapp/core/store.dart';
import 'package:newapp/model/cart.dart';
import 'package:newapp/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:newapp/model/catalog.dart';
import 'package:newapp/screens/home_detail_page.dart';
import 'package:newapp/utils/routes.dart';
import 'package:newapp/widgets/themes.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          // ignore: non_constant_identifier_names
          builder: (context, MyStore, _) => FloatingActionButton(
            backgroundColor: MyTheme.darkBluish,
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cart);
            },
            child: Icon(CupertinoIcons.cart),
          ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
        ),
        body: SafeArea(
            child: Container(
                padding: Vx.m32,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CatalogHeader(),
                      if (CatalogModel.items == null)
                        CircularProgressIndicator().centered().expand()
                      else
                        CatalogList().expand()
                    ]))));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluish).make(),
        "Trending Products".text.xl2.make().py(20)
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog),
            ),
          ),
          child: CatalogItem(catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  CatalogItem(this.catalog);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl.color(MyTheme.darkBluish).bold.make(),
                catalog.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    AddToCart(catalog: catalog)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  CatalogImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
