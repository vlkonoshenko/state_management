import 'package:example/data/product.dart';

abstract class BacketEvent {}

class AddProduct extends BacketEvent {
  final Product product;

  AddProduct(this.product);
}
