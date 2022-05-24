import 'package:flutter/material.dart';
import '../modals/cart.dart';
import '../modals/products.dart';

class CartViewModal extends ChangeNotifier {
  final List<CartStuff> _addedproduct = [];
  double totalPrice = 0;
  List get items => _addedproduct;

  void addproducts(Products product, int? quantity) {
    final cartstuff = CartStuff(product: product, quantity: quantity ?? 1);
    if (_addedproduct.contains(cartstuff)) {
      int index = _addedproduct.indexWhere((element) => element == cartstuff);
      _addedproduct[index].quantity++;
    } else {
      _addedproduct.add(cartstuff);
    }
    total();
    notifyListeners();
  }

  void removeproduct(item) {
    _addedproduct.remove(item);
    total();
    notifyListeners();
  }

  void quantity(CartStuff cartStuff, int counter) {
    if (counter == -1) {
      if (cartStuff.quantity > 1) {
        cartStuff.quantity = cartStuff.quantity + counter;
      } else if (counter == -1) {
        _addedproduct.remove(cartStuff);
      }
    } else if (counter == 1) {
      cartStuff.quantity = cartStuff.quantity + counter;
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
