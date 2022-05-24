import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/core/viewModals/cart_viewmodal.dart';

import '../../../../config/color_palette.dart';
import '../../../../core/modals/cart.dart';
import 'add_remove_button.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cart}) : super(key: key);

  final CartStuff cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 24.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  cart.product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 113.w,
                          child: Text(
                            cart.product.title,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(width: 60.w),
                        Text("\$ ${cart.product.price.toStringAsFixed(2)}"),
                      ],
                    ),
                    SizedBox(height: 21.h),
                    Row(
                      children: [
                        const Text.rich(
                          TextSpan(text: "Size: ", children: [
                            TextSpan(
                              text: "S",
                              style: TextStyle(color: Colors.black),
                            )
                          ]),
                          style: TextStyle(fontSize: 12, color: ColorPalette.appGrey),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Color",
                              style: TextStyle(fontSize: 12, color: ColorPalette.appGrey),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xff222A2D),
                              ),
                            ),
                            SizedBox(width: 26.w),
                          ],
                        ),
                        Row(
                          children: [
                            AddRemoveButton(
                              icon: Icons.remove,
                              onTap: () {
                                Provider.of<CartViewModal>(context, listen: false).quantity(cart, -1);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              child: Text(cart.quantity.toString()),
                            ),
                            AddRemoveButton(
                              icon: Icons.add,
                              onTap: () {
                                Provider.of<CartViewModal>(context, listen: false).quantity(cart, 1);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: const Divider(),
        )
      ],
    );
  }
}
