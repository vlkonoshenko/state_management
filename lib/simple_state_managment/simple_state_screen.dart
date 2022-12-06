import 'package:example/data/product_list.dart';
import 'package:example/service/store_service.dart';
import 'package:flutter/material.dart';

class SimpleStateScreen extends StatefulWidget {
  const SimpleStateScreen({super.key});

  @override
  State<SimpleStateScreen> createState() => _SimpleStateScreenState();
}

class _SimpleStateScreenState extends State<SimpleStateScreen> {
  final StoreService _storeService = StoreService();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(title: Text('Backet: ${_storeService.basket.totalPrice}')),
      body: ListView(
        shrinkWrap: true,
        children: products
            .map((e) => ListTile(
                  title: Text(e.name),
                  onTap: () {
                    setState(() {
                      _storeService.addProductTobBasket(e);
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
