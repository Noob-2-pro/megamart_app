import 'package:flutter/material.dart';
import 'package:zucosi_app/config/color_palette.dart';

ThemeData theme() {
  return ThemeData(
      backgroundColor: const Color(0xffE5E5E5),
      scaffoldBackgroundColor: const Color(0xffE5E5E5),
      fontFamily: "Poppins",
      textTheme: textTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xffF3F4F6),
        toolbarTextStyle: const TextStyle().copyWith(color: ColorPalette.appBlack),
      ));
}

TextTheme textTheme() {
  return const TextTheme().copyWith(
    subtitle1: const TextStyle(fontWeight: FontWeight.w600, color: ColorPalette.appBlack),
  );
}
