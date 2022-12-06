import 'package:example/data/basket.dart';

import '../data/product.dart';

class StoreService {
  final Basket basket = Basket();

  void addProductTobBasket(Product product) {
    basket.productList.add(product);
  }

  void removeProductToBasket(Product product) {
    basket.productList.remove(product);
  }
}
