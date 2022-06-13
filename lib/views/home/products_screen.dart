import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/core/viewModals/cart_viewmodal.dart';
import 'package:zucosi_app/core/viewModals/home_viewmodal.dart';
import 'components/components.dart';
import 'package:zucosi_app/core/modals/modals.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final homeData = HomeViewModal();
  late Future<List<Products>> productData;

  @override
  void initState() {
    super.initState();
    productData = homeData.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: FutureBuilder<List<Products>>(
          future: productData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: FittedBox(
                    child: Text(
                  "Oops , an error occured ! \n ${snapshot.error}",
                  textAlign: TextAlign.center,
                )),
              );
            }
            if (snapshot.hasData) {
              final products = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.only(top: 6),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 230,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final isAdded =
                      Provider.of<CartViewModal>(context).items.contains(CartStuff(product: products[index]));
                  return ProductTile(
                    product: products[index],
                    isAdded: isAdded,
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
