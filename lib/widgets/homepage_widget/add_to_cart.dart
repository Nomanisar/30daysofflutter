// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use, iterable_contains_unrelated_type

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;
  const AddToCart({
    Key? key,
    required this.catelog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catelog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(item: catelog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          ),
        ),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(
                CupertinoIcons.cart_badge_plus,
              ));
  }
}
