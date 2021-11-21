import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.cubit.dart';
import 'package:urlshorty/ui/screens/history.screen.dart';
import 'package:urlshorty/ui/screens/home.screen.dart';
import 'package:urlshorty/ui/screens/qr_view.screen.dart';

class AppRouter {
  static const String initialRoute = HomeScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (BuildContext context) => HomeScreen(
          goTinyCubit: BlocProvider.of<GoTinyCubit>(context),
        ),
    QRViewScreen.routeName: (BuildContext context) => const QRViewScreen(),
    HistoryScreen.routeName: (BuildContext context) => const HistoryScreen(),
  };

  static Future<dynamic> navigateToQRViewScreen(BuildContext context) async {
    return Navigator.of(context).pushNamed(QRViewScreen.routeName);
  }

  const AppRouter._();
}
