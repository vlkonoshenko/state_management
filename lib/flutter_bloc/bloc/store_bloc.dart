import 'package:example/data/backet.dart';
import 'package:example/flutter_bloc/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class StoreBloc extends Bloc<BacketEvent, StoreState> {
  final Backet _backet = Backet();

  StoreBloc() : super(StoreState(0, 0)) {
    on<AddProduct>((event, emit) {
      _backet.productList.add(event.product);
      emit(StoreState(
        _backet.productList.length,
        _backet.totalPrice,
      ));
    });
  }
}
