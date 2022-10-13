import 'package:example/data/product.dart';
import 'package:example/data/product_list.dart';
import 'package:example/flutter_bloc/bloc/state.dart';
import 'package:example/service/store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, StoreState>((ref) {
  return Counter();
});

class Counter extends StateNotifier<StoreState> {
  final _storeService = StoreService();

  Counter() : super(StoreState(0, 0));

  void addProduct(Product product) {
    _storeService.addProductToBacket(product);
    state = StoreState(
      _storeService.backet.productList.length,
      _storeService.backet.totalPrice,
    );
  }
}

class FlutterRiverpodScreen extends ConsumerWidget {
  const FlutterRiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Backet: ${count.totalPrice}'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: products
            .map((e) => ListTile(
                  title: Text(e.name),
                  onTap: () {
                    ref.read(counterProvider.notifier).addProduct(e);
                  },
                ))
            .toList(),
      ),
    );
  }
}
