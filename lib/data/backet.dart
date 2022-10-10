import 'package:example/data/product.dart';

class Backet {
  List<Product> productList = [];

  Backet();

  int get totalPrice => productList.fold(
      0, (previousValue, element) => previousValue + element.price);
}
