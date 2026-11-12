import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/onboarding/presentation/ui/widgets/onboarding_button.dart';
import 'package:bookia_app/features/onboarding/presentation/ui/widgets/onboarding_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset('assets/image/onboarding.png').image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                135.verticalSpace,
                OnboardingHeader(),
                330.verticalSpace,
                OnboardingButton(
                  text: 'Login',
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.gold,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.loginScreen);
                  },
                ),
                15.verticalSpace,
                OnboardingButton(
                  text: 'Register',
                  foregroundColor: AppColors.black,
                  backgroundColor: AppColors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.registerScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
