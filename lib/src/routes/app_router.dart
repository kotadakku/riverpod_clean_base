import 'package:riverpod_base/src/presentation/view/pages/auth/login_page.dart';
import 'package:riverpod_base/src/presentation/view/pages/home_view.dart';
import 'package:riverpod_base/src/presentation/view/pages/pages.dart';
import 'package:riverpod_base/src/routes/app_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
part 'app_routes.dart';

class AppRouter {

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(
          builder: (_) => const ControlPage()
        );
      case Routes.LOGIN:
        return MaterialPageRoute(
            builder: (_) => const LoginPage()
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}