// Feature/auth/presentation/ui/login_screen.dart
import 'package:bookstore/Core/routes/App_Routes.dart';
import 'package:bookstore/Core/theme/app_colors.dart';
import 'package:bookstore/Core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginscreen);
              },
              icon: Icon(Icons.abc, color: AppColors.maincolor),
            ),
            Text("mostafa faiz", style: AppTextStyles.text),
          ],
        ),
      ),
    );
  }
}
