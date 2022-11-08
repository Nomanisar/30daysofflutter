import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/homepage_widget/catelog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => HomeDetailPage(catelog: catelog)),
            ),
          ),
          child: CatelogItem(catelog: catelog),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  const CatelogItem({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  final Item catelog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatelogImage(
            image: catelog.image,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.color(Mytheme.darkBlueishColor).lg.bold.make(),
              catelog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Mytheme.darkBlueishColor),
                      shape: MaterialStateProperty.all(
                        const StadiumBorder(),
                      ),
                    ),
                    child: "Buy".text.make(),
                  ),
                ],
              ).pOnly(right: 8.0),
            ],
          ),
        )
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
