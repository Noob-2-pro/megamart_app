import 'package:http/http.dart' as http;
import 'package:zucosi_app/core/modals/products.dart';

class Networking {
  final String endPoint = 'https://fakestoreapi.com';

  var client = http.Client();

  Future<List<Products>> getProducts() async {
    List<Products> products = [];
    try {
      var url = Uri.parse("$endPoint/products");
      var response = await client.get(url);
      products = productsFromJson(response.body);
    } catch (e) {
      return Future.error("error: $e");
    }
    return products;
  }
}
