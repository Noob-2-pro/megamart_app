import 'package:zucosi_app/core/modals/products.dart';

class CartStuff {
  final Products product;
  int quantity;

  CartStuff({required this.product, this.quantity = 1});

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is CartStuff &&
    runtimeType == other.runtimeType &&
    product == other.product;
  

  @override
  int get hashCode => product.hashCode;
}

