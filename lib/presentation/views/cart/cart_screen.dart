import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/config/color_palette.dart';
import 'package:zucosi_app/core/viewModals/cart_viewmodal.dart';
import 'components/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffE5E5E5),
        elevation: 0,
        toolbarHeight: 152.h,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: Theme.of(context).textTheme.bodyText1,
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
                background: Container(
                  color: ColorPalette.appBlack.withOpacity(0.5),
                ),
                key: ValueKey(item),
                onDismissed: (DismissDirection direction) {
                  Provider.of<CartViewModal>(context, listen: false).removeproduct(item);
                },
                child: CartCard(
                  cart: cart.items[index],
                ),
              );
            }),
          )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total price",
                    style: TextStyle(fontSize: 16),
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
                  onPressed: () {},
                  child: SizedBox(
                      height: 64.h,
                      child: const Center(
                        child: Text('Payment'),
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
