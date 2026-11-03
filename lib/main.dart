import 'package:elearning/core/theme/app_theme.dart';
import 'package:elearning/login_page.dart';
import 'package:elearning/signin_page.dart';
import 'package:elearning/views/auth/compeletprofile.dart';
import 'package:elearning/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App',
          home: const HomeView(),
        );
      },
    );
  }
}
