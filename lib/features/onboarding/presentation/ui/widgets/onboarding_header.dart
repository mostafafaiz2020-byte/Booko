import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/image/logo.png',
          width: 210.w,
          height: 66.h,
          fit: BoxFit.contain,
        ),
        12.verticalSpace,
        Text(
          '!Order Your Book Now',
          style: AppTextStyles.dmRegular20.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
