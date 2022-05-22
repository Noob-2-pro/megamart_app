import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/color_palette.dart';
import 'add_remove_button.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 24.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Rectangle_1.png",
                width: 80.w,
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
                            "Me Bandage black dress",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(width: 66.w),
                        Text(r"$ 69.00"),
                      ],
                    ),
                    SizedBox(height: 21.h),
                    Row(
                      children: [
                        Text.rich(
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
                            Text(
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
                                color: Color(0xff222A2D),
                              ),
                            ),
                            SizedBox(width: 26.w),
                          ],
                        ),
                        Row(
                          children: [
                            AddRemoveButton(
                              icon: Icons.remove,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              child: Text("1"),
                            ),
                            AddRemoveButton(
                              icon: Icons.add,
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
          child: Divider(),
        )
      ],
    );
  }
}
