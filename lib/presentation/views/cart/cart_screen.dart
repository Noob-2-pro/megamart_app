import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zucosi_app/config/color_palette.dart';

import 'components/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        toolbarHeight: 152.h,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [CartCard()],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total price",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "\$ 215",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40.h, top: 16.h),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) => ColorPalette.appBlack),
                    ),
                    onPressed: () {},
                    child: Container(
                        height: 64.h,
                        child: Center(
                          child: Text('Payment'),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
