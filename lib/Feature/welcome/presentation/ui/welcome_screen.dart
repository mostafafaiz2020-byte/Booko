// Feature/welcome/presentation/ui/welcome_screen.dart
import 'package:bookstore/Core/routes/App_Routes.dart';
import 'package:bookstore/Core/theme/app_colors.dart';
import 'package:bookstore/Core/theme/app_text_styles.dart';
import 'package:bookstore/Core/widgets/main_botton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/welcome_screen.png'),
          ),
        ),
        child: Column(
          children: [
            135.verticalSpace,

            IconButton(
              onPressed: () {
                if (context.locale.languageCode == "ar") {
                  context.setLocale(Locale("en"));
                } else {
                  context.setLocale(Locale("ar"));
                }
              },
              icon: Icon(Icons.language),
            ),
            Image.asset('assets/images/logo 2.png'),

            28.verticalSpace,

            Text('Order Your Book Now!', style: AppTextStyles.text),

            340.verticalSpace,

            MainBotton(
              Titel: 'Login',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.loginscreen);
              },
              backgroundColor: AppColors.maincolor,
              textColor: AppColors.whitecolor,
            ),

            15.verticalSpace,

            MainBotton(
              Titel: 'Register',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.RegisterScreen);
              },
              backgroundColor: AppColors.whitecolor,
              textColor: AppColors.darkcolor,
            ),
          ],
        ),
      ),
    );
  }
}
