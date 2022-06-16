import 'package:flutter/material.dart';
import 'package:travel_organizer/app/presentation/pages/home/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/home": (context) => const HomePage(),
  };
}
