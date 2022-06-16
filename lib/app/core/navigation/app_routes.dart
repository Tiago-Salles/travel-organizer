import 'package:flutter/material.dart';
import 'package:travel_organizer/app/presentation/pages/home/home_page.dart';
import 'package:travel_organizer/app/presentation/pages/login/login_page.dart';
import 'package:travel_organizer/app/presentation/pages/splash/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/splashPage": (context) => const SplashPage(),
    "/home": (context) => const HomePage(),
    "/loginPage": (context) => const LoginPage()
  };
}
