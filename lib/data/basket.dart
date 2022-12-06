import 'package:example/data/product.dart';

class Basket {
  List<Product> productList = [];

  int get totalPrice => productList.fold(
      0, (previousValue, element) => previousValue + element.price);
}
