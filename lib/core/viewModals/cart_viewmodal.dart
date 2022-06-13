import 'package:flutter/material.dart';
import '../modals/cart.dart';
import '../modals/products.dart';

class CartViewModal extends ChangeNotifier {
  final List<CartStuff> _addedproduct = [];
  double totalPrice = 0;
  List<CartStuff> get items => _addedproduct;

  void addproducts({required Products product, int? quantity}) {
    final cartstuff = CartStuff(product: product, quantity: quantity ?? 1);

    if (_addedproduct.contains(cartstuff)) {
      // increase the quantity of product
      int index = _addedproduct.indexWhere((element) => element == cartstuff);
      _addedproduct[index].quantity++;
    } else {
      // add new product
      _addedproduct.add(cartstuff);

    }
    total();
    notifyListeners();
  }

  void removeproduct(CartStuff item) {
    _addedproduct.remove(item);
    total();
    notifyListeners();
  }

  void quantity(CartStuff cartStuff, int counter) {
    if (counter == -1) {
      if (cartStuff.quantity > 1) {
        cartStuff.quantity += counter;
      } else {
        _addedproduct.remove(cartStuff);
      }
    } else if (counter == 1) {
      cartStuff.quantity += counter;
    }

    total();
    notifyListeners();
  }

  void total() {
    totalPrice = 0;
    for (int i = 0; i < _addedproduct.length; i++) {
      totalPrice = (totalPrice + _addedproduct[i].product.price * _addedproduct[i].quantity);
    }
    notifyListeners();
  }
}
