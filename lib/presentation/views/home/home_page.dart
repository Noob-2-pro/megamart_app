import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/presentation/views/home/cart_screen.dart';
import '../../../core/services/bottom_navbar_provider.dart';
import '../../shared_components/custom_bottom_navbar.dart';
import 'components/custom_app_bar.dart';
import 'products_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var tabScreens = [
    ProductsScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(152), child: CustomAppBar()),
      bottomNavigationBar: CutomBottomBar(),
      body: tabScreens[Provider.of<BottomNavBarProvider>(context).selectedIndex],
    );
  }
}
