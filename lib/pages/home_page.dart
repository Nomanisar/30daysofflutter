// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

import '../widgets/drawer.dart';

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
      appBar: AppBar(
        title: const Text(
          "EAT FRESH",
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatelogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: CatelogModel.items.length,
                itemBuilder: (context, index) {
                  final items = CatelogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        child: Text(
                          items.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Text(
                          items.price.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      child: Image.network(items.image),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
