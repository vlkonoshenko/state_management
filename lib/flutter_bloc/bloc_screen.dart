import 'package:example/data/product_list.dart';
import 'package:example/flutter_bloc/bloc/store_bloc.dart';
import 'package:example/service/store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/events.dart';
import 'bloc/state.dart';

class BlocScreen extends StatelessWidget {
  final StoreBloc storeBloc = StoreBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<StoreBloc, StoreState>(
          bloc: storeBloc,
          builder: (_, state) {
            return Text('Backet: ${state.totalPrice}');
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: products
            .map((e) => ListTile(
                  title: Text(e.name),
                  onTap: () {
                    storeBloc.add(AddProduct(e));
                  },
                ))
            .toList(),
      ),
    );
  }
}
