import "package:flutter/material.dart";
import 'package:newapp/core/store.dart';
import 'package:newapp/model/cart.dart';
import 'package:newapp/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

class Mycart extends StatelessWidget {
  const Mycart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "Cart"
            .text
            .bold
            .xl3
            .color(MyTheme.darkBluish)
            .makeCentered()
            .pOnly(right: 40),
      ),
      body: SafeArea(
        child: Column(
          children: [_CardList().p32().expand(), Divider(), _CardTotal()],
        ),
      ),
    );
  }
}

class _CardTotal extends StatelessWidget {
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            // ignore: non_constant_identifier_names
            builder: (context, MyStore, _) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(MyTheme.darkBluish)
                  .make()
                  .p32();
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported".text.make()));
            },
            child: "Buy".text.xl.bold.make(),
          ).p32().h16(context).w40(context),
        ],
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(
      context,
      on: [RemoveMutation],
    );
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing To Show Here"
            .text
            .xl
            .bold
            .color(MyTheme.darkBluish)
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: Colors.green,
              ),
              trailing: IconButton(
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
              ),
              title: _cart.items[index].name.text.xl.bold.make(),
            ),
          );
  }
}
