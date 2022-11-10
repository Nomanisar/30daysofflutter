import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catelog;
  const AddToCart({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catelog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catelog = CatelogModel();
            _cart.add(widget.catelog);
            _cart.catelog = _catelog;
            setState(() {});
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
