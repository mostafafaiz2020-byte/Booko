// Core/routes/app_router.dart
import 'package:bookstore/Core/routes/App_Routes.dart';
import 'package:bookstore/Feature/auth/presentation/ui/Register.dart';
import 'package:bookstore/Feature/auth/presentation/ui/login_screen.dart';
import 'package:bookstore/Feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.welcome_screen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case AppRoutes.RegisterScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return null;
    }
  }
}
