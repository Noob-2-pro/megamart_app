import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zucosi_app/config/theme.dart';
import 'package:zucosi_app/locator.dart';
import 'package:zucosi_app/presentation/views/home/home_page.dart';

import 'core/services/bottom_navbar_provider.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => BottomNavBarProvider(),
            )
          ],
          child: MaterialApp(
            home: HomePage(),
            theme: theme(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
