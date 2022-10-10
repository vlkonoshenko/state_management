import 'package:example/data/backet.dart';

import '../data/product.dart';

class StoreService {
  final Backet backet = Backet();

  void addProductToBacket(Product product) {
    backet.productList.add(product);
  }

  void removeProductToBacket(Product product) {
    backet.productList.remove(product);
  }
}
