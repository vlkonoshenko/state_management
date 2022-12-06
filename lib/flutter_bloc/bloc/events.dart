import 'package:example/data/product.dart';

abstract class BasketEvent {}

class AddProduct extends BasketEvent {
  final Product product;

  AddProduct(this.product);
}
