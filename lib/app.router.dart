import 'package:flutter/material.dart';
import 'package:urlshorty/ui/screens/history.screen.dart';
import 'package:urlshorty/ui/screens/home.screen.dart';
import 'package:urlshorty/ui/screens/qr_view.screen.dart';

class AppRouter {
  static const String initialRoute = HomeScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    QRViewScreen.routeName: (BuildContext context) => const QRViewScreen(),
    HistoryScreen.routeName: (BuildContext context) => const HistoryScreen(),
  };

  Future<void> navigateToQRViewScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(context, QRViewScreen.routeName);
  }

  const AppRouter._();
}
