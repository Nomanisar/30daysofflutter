// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_getters_setters

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/store.dart';
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
}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;
  AddMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemids.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;
  RemoveMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemids.remove(item.id);
  }
}
