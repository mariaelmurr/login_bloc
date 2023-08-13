import 'package:bloc_tutorial/presentation/screens/home_page_screen.dart';
import 'package:bloc_tutorial/presentation/screens/loading_screen.dart';
import 'package:bloc_tutorial/presentation/screens/login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String loadingScreenRoute = '/loadingScreen';
  static const String homeRoute = '/home';
  static const String logInRoute = '/login';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loadingScreenRoute:
        return MaterialPageRoute(builder: (BuildContext context) {
          return LoadingScreen();
        });
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        });

      case AppRoutes.logInRoute:
        return MaterialPageRoute(builder: (BuildContext context) {
          return LoginPage();
        });

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Not Found'),
            ),
            body: Text('Page not found!'),
          );
        });
    }
  }
}
