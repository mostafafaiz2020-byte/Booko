import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/auth/presentation/ui/widgets/login_form.dart';
import 'package:bookia/features/auth/presentation/ui/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                11.verticalSpace,
                ArrowBack(),
                29.verticalSpace,
                Text(
                  "Hello! Register to get\nstarted",
                  style: AppTextStyles.titleRegular,
                ),
                32.verticalSpace,
                RegisterForm(),
                160.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppTextStyles.hintTextStyle.copyWith(
                        color: Color(0xff032426),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                      child: Text(
                        " Login Now",
                        style: AppTextStyles.hintTextStyle.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
