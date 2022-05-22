import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zucosi_app/core/modals/products.dart';
import 'package:zucosi_app/core/viewModals/home_viewmodal.dart';
import '../../../../config/color_palette.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({
    Key? key,
  }) : super(key: key);

  final homeData = HomeViewModal();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: FutureBuilder<List<Products>>(
          future: homeData.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Oops , an error occured ! \n ${snapshot.error}"),
              );
            }
            if (snapshot.hasData) {
              final products = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 230,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    product: products[index],
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // width: 165.w,
      // height: 270.h,
      child: Column(
        children: [
          Image.network(
            product.image,
            height: 180.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.overline?.copyWith(color: ColorPalette.textprimary),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.category,
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 13.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${product.price}",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      InkWell(
                        onTap: () {
                          //TODO : add to cart here
                        },
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: ColorPalette.appGrey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
