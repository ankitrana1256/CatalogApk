import 'package:flutter/material.dart';
import 'package:newapp/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:newapp/model/cart.dart';
import 'package:newapp/model/catalog.dart';
import 'package:newapp/widgets/themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      onPressed: () {
        AddMutation(catalog);
      },
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart),
    );
  }
}
