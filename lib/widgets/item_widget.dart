import "package:flutter/material.dart";
import 'package:newapp/model/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        child: ListTile(
          onTap: () {
            print(item.name);
          },
          leading: Container(
            width: 100,
            child: Image.network(
              item.image,
              alignment: Alignment.center,
            ),
          ),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}
