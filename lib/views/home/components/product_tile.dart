import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/color_palette.dart';
import 'package:provider/provider.dart';
import '../../../../core/viewModals/cart_viewmodal.dart';
import '../../../../core/modals/modals.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.isAdded,
  }) : super(key: key);

  final Products product;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.network(
            product.image,
            height: 180.h,
            width: double.infinity,
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
                  // maxLines: 2,
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
                        onTap: !isAdded
                            ? () {
                                context.read<CartViewModal>().addproducts(product: product);
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Product added to the cart"),
                                  duration: Duration(seconds: 2),
                                ));
                              }
                            : (() {
                                context.read<CartViewModal>().removeproduct(CartStuff(product: product));
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Product removed from the cart"),
                                  duration: Duration(seconds: 2),
                                ));
                              }),
                        child: !isAdded
                            ? const Icon(
                                Icons.add_shopping_cart,
                                color: ColorPalette.textprimary,
                              )
                            : Icon(
                                Icons.remove_circle_outline_sharp,
                                color: Colors.red.shade200,
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
