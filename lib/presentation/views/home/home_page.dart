import 'package:flutter/material.dart';
import '../../shared_components/custom_bottom_navbar.dart';
import 'components/custom_app_bar.dart';
import 'products_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(152), child: CustomAppBar()),
      bottomNavigationBar: CutomBottomBar(),
      body: ProductsScreen(),
    );
  }
}
