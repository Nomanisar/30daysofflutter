import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "EAT FRESH".text.xl5.bold.color(Mytheme.darkBlueishColor).make(),
        "Trending Products".text.xl2.bold.make()
      ],
    );
  }
}
