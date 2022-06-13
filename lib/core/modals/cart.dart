import 'package:zucosi_app/core/modals/products.dart';

class CartStuff {
  final Products product;
  int quantity;
  final bool isAdded;

  CartStuff({required this.product, this.quantity = 1,this.isAdded = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CartStuff && runtimeType == other.runtimeType && product == other.product;

  @override
  int get hashCode => product.hashCode;
}
