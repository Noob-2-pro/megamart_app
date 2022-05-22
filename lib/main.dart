import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zucosi_app/config/navigation.dart';
import 'package:zucosi_app/config/theme.dart';
import 'package:zucosi_app/presentation/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) {
        return MaterialApp(
          home: HomePage(),
          theme: theme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.generateRoute,
        );
      },
    );
  }
}
