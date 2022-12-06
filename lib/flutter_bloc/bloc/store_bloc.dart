import 'package:example/data/basket.dart';
import 'package:example/flutter_bloc/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class StoreBloc extends Bloc<BasketEvent, StoreState> {
  final Basket _basket = Basket();

  StoreBloc() : super(StoreState(0, 0)) {
    on<AddProduct>((event, emit) {
      _basket.productList.add(event.product);
      emit(StoreState(
        _basket.productList.length,
        _basket.totalPrice,
      ));
    });
  }
}
