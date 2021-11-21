import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.cubit.dart';
import 'package:urlshorty/blocs/history/history.cubit.dart';
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
    HistoryScreen.routeName: (BuildContext context) => HistoryScreen(
          historyCubit: BlocProvider.of<HistoryCubit>(context),
        ),
  };

  static Future<dynamic> navigateToQRViewScreen(BuildContext context) async {
    return Navigator.of(context).pushNamed(QRViewScreen.routeName);
  }

  static void navigateToHistoryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(HistoryScreen.routeName);
  }

  const AppRouter._();
}
