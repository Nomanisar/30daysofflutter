import 'package:flutter_catalog/models/catelog.dart';

class CartModel {
  //Catelog field
  late CatelogModel _catelog;

  //Collection of items IDs
  late final List<int> _itemids = [];

  //Getter of _catelog
  CatelogModel get catelog => _catelog;

  //setter of _catelog
  set catelog(CatelogModel newCatelog) {
    _catelog = newCatelog;
  }

  //Get items in Cart

  List<Item> get items => _itemids.map((id) => _catelog.getbyId(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item

  void add(Item item) {
    _itemids.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemids.remove(item.id);
  }
}
