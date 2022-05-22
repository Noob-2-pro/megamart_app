import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zucosi_app/core/services/bottom_navbar_provider.dart';
import '../../config/color_palette.dart';
import 'package:provider/provider.dart';

class CutomBottomBar extends StatelessWidget {
  CutomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      selectedIndex: context.watch<BottomNavBarProvider>().selectedIndex,
      onTabChange: context.read<BottomNavBarProvider>().onItemTapped,
      gap: 13.2.w,
      tabBackgroundColor: ColorPalette.selectedButton.withOpacity(0.1),
      tabMargin: EdgeInsets.only(top: 16.h, bottom: 32.h),
      tabBorderRadius: 18,
      textSize: Theme.of(context).textTheme.caption?.fontSize,
      color: ColorPalette.appGrey,
      padding: EdgeInsets.all(14),
      tabs: [
        GButton(
          icon: Icons.home_outlined,
          text: "Home",
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: "Cart",
        ),
      ],
      backgroundColor: Color(0xffFEFEFE),
    );
  }
}
