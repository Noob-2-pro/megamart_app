import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/color_palette.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 13, crossAxisSpacing: 13, childAspectRatio: 0.8),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          width: 165.w,
          height: 270.h,
          child: Column(
            children: [
              Image.asset(
                "assets/images/Rectangle_1.png",
                height: 180.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w, top: 13.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nicole miller",
                      style: Theme.of(context).textTheme.overline?.copyWith(color: ColorPalette.textprimary),
                    ),
                    Text(
                      "me bandade dress",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 13.5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r"$ 110.00",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          InkWell(
                            onTap: () {
                              //TODO : add to cart here
                            },
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: ColorPalette.appGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
