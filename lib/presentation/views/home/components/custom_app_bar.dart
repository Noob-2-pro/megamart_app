import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/core/viewModals/cart_viewmodal.dart';
import 'package:zucosi_app/presentation/views/cart/cart_screen.dart';
import '../../../../config/color_palette.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.appBarColor,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 24.w,
            top: 50.h,
            right: 24.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MegaMart",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.kCartRoute);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(Provider.of<CartViewModal>(context).items.length.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
