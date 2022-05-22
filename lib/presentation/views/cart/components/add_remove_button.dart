import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/color_palette.dart';

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          border: Border.all(color: ColorPalette.appGrey),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}
