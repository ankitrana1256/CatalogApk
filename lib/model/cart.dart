import 'package:newapp/core/store.dart';
import 'package:newapp/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartmodel = CartModel._internal();
  // CartModel._internal() : _catalog = CatalogModel();
  // factory CartModel() => cartmodel;

  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
