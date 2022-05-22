import 'package:zucosi_app/core/services/networking_service.dart';

import '../modals/products.dart';

class HomeViewModal {
  final networking = Networking();

  List products = [];

  Future<List<Products>> getProducts() async {
    var products = await networking.getProducts();
    return products;
  }
}
