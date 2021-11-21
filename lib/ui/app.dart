import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urlshorty/app.router.dart';
import 'package:urlshorty/ui/themes/app.theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
