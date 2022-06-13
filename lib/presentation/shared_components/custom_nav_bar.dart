import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zucosi_app/presentation/views/cart/cart_screen.dart';

import '../../config/color_palette.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      color: ColorPalette.appBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NavBarButton(
            text: "Home",
            image: 'assets/images/home.png',
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartScreen.kCartRoute);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/shopping_bag.png'),
            ),
          )
        ],
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.text,
    required this.image,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final String image;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 108.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: ColorPalette.selectedButton.withOpacity(0.1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset(image)),
            SizedBox(width: 13.2.w),
            text.isNotEmpty
                ? Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
