// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import '../widgets/drawer.dart';
import '../widgets/homepage_widget/catelog_list.dart';
import '../widgets/homepage_widget/catelogheader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final day = 30;

  final name = "Noman";

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodData = jsonDecode(catelogJson);
    var productData = decodData["products"];
    CatelogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogModel.items.isNotEmpty)
                  CatelogList().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
