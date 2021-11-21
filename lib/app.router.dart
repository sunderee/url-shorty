import 'package:flutter/material.dart';
import 'package:urlshorty/ui/screens/history.screen.dart';
import 'package:urlshorty/ui/screens/home.screen.dart';

class AppRouter {
  static const String initialRoute = HomeScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    HistoryScreen.routeName: (BuildContext context) => const HistoryScreen(),
  };

  const AppRouter._();
}
