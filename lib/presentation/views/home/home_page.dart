import 'package:flutter/material.dart';
import 'package:zucosi_app/presentation/shared_components/custom_nav_bar.dart';
import 'components/custom_app_bar.dart';
import 'products_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(152), child: CustomAppBar()),
      bottomNavigationBar: const CustomNavBar(),
      body: ProductsScreen(),
    );
  }
}
