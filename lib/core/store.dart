import 'package:velocity_x/velocity_x.dart';
import 'package:newapp/model/cart.dart';
import 'package:newapp/model/catalog.dart';

class MyStore extends VxStore {
  final catalog = CatalogModel();
  final cart = CartModel();

  MyStore() {
    cart.catalog = catalog;
  }
}
