import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zucosi_app/constants.dart';
import '../../config/color_palette.dart';

class CutomBottomBar extends StatefulWidget {
  const CutomBottomBar({Key? key}) : super(key: key);

  @override
  State<CutomBottomBar> createState() => _CutomBottomBarState();
}

class _CutomBottomBarState extends State<CutomBottomBar> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      selectedIndex: selectedIndex,
      gap: 13.2.w,
      tabBackgroundColor: ColorPalette.selectedButton.withOpacity(0.1),
      tabMargin: EdgeInsets.only(top: 16.h, bottom: 32.h),
      tabBorderRadius: 18,
      textSize: Theme.of(context).textTheme.caption?.fontSize,
      color: ColorPalette.appGrey,
      padding: const EdgeInsets.all(14),
      onTabChange: (index) {
        if (index == 1) {
          Navigator.pushNamed(context, kCartRoute);
          setState(() {
           selectedIndex = 0;
          });
        }
      },
      tabs: const [
        GButton(
          icon: Icons.home_outlined,
          text: "Home",
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          onPressed: null,
        ),
      ],
      backgroundColor: const Color(0xffFEFEFE),
    );
  }
}
