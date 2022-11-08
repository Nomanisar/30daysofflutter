import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogImage extends StatelessWidget {
  final String image;
  const CatelogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(Mytheme.creamColor).make().p16().w40(
          context,
        );
  }
}
