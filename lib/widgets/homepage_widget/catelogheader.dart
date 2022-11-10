import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "EAT FRESH".text.xl5.bold.color(context.accentColor).make(),
        "Trending Products".text.xl2.bold.make()
      ],
    );
  }
}
