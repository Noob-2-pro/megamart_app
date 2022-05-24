import 'package:flutter/material.dart';
import 'package:zucosi_app/constants.dart';
import 'package:zucosi_app/presentation/views/cart/cart_screen.dart';
import 'package:zucosi_app/presentation/views/home/home_page.dart';


class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case kCartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
