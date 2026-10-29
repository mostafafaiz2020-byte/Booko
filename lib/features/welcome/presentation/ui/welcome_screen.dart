import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:bookia/core/widgets/app_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/images/bgimage.png").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              135.verticalSpace,

              Image.asset("assets/images/logo1.png"),
              28.verticalSpace,
              Text("Order Your Book Now!", style: AppTextStyles.welcomeStyle),
              333.verticalSpace,
              AppBotton(
                title: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
              ),
              15.verticalSpace,
              AppBotton(
                title: 'Register',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.registerScreen);
                },
                bgColor: AppColors.whiteColor,
                titleColor: AppColors.darkColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
