import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../color_palette.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.appBarColor,
      height: 152.h,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 24.w,
            top: 56.h,
            bottom: 72.h,
            right: 24.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.short_text_rounded,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 112.h,
            left: 24.w,
            bottom: 19.h,
            child: Text("New Arrivals", style: Theme.of(context).textTheme.bodyText2),
          )
        ],
      ),
    );
  }
}
