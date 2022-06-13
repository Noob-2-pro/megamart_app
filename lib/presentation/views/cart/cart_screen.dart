import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/config/color_palette.dart';
import 'package:zucosi_app/core/viewModals/cart_viewmodal.dart';
import 'components/cart_card.dart';

class CartScreen extends StatelessWidget {
  static const String kCartRoute = "/cartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffE5E5E5),
        elevation: 2,
        toolbarHeight: 75.h,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.navigate_before_rounded),
        ),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModal>(
      builder: (context, cart, child) {
        return cartItem(cart, context);
      },
    );
  }

  Padding cartItem(CartViewModal cart, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: List.generate(cart.items.length, (index) {
              final item = cart.items[index];
              return Dismissible(
                key: ValueKey(item),
                background: Container(
                  color: ColorPalette.appBlack.withOpacity(0.5),
                ),
                onDismissed: (DismissDirection direction) {
                  Provider.of<CartViewModal>(context, listen: false).removeproduct(item);
                },
                child: CartCard(
                  cartItem: cart.items[index],
                ),
              );
            }),
          )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total price",
                    style: TextStyle(fontSize: ScreenUtil().scaleText * 16),
                  ),
                  Flexible(
                    child: Text(
                      '\$ ${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40.h, top: 16.h),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => ColorPalette.appBlack),
                  ),
                  onPressed: () {
                    if (Platform.isAndroid) {
                      Fluttertoast.showToast(msg: "successful payment");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("successful payment")));
                    }
                  },
                  child: SizedBox(
                      height: 64.h,
                      child: Center(
                        child: Text(
                          'Proceed to pay',
                          style: TextStyle(fontSize: ScreenUtil().scaleText * 16),
                        ),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
