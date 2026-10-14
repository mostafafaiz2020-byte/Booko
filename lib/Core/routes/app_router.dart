// Core/routes/app_router.dart

import 'package:bookstore/Core/routes/App_Routes.dart';
import 'package:bookstore/Feature/auth/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
