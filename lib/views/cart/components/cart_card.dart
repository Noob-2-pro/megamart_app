import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/core/viewModals/cart_viewmodal.dart';
import '../../../../config/color_palette.dart';
import '../../../../core/modals/cart.dart';
import 'add_remove_button.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cartItem}) : super(key: key);

  final CartStuff cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.white,
                child: Image.network(
                  cartItem.product.image,
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
                            cartItem.product.title,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(width: 60.w),
                        FittedBox(child: Text("\$ ${cartItem.product.price.toStringAsFixed(2)}")),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisSize: MainAxisSize.min,
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
                          ],
                        ),
                        SizedBox(width: 18.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AddRemoveButton(
                              icon: Icons.remove,
                              onTap: () {
                                Provider.of<CartViewModal>(context, listen: false).quantity(cartItem, -1);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: FittedBox(child: Text(cartItem.quantity.toString())),
                            ),
                            AddRemoveButton(
                              icon: Icons.add,
                              onTap: () {
                                Provider.of<CartViewModal>(context, listen: false).quantity(cartItem, 1);
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
