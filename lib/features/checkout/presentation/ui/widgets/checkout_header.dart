import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            width: 41.w,
            height: 41.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.outlineGray),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18.r,
              color: AppColors.black,
            ),
          ),
        ),

        30.verticalSpace,

        Text(
          'Place Your Order',
          style: AppTextStyles.dmRegular30.copyWith(color: AppColors.black),
        ),
        10.verticalSpace,

        Text(
          "Don't worry! It occurs. Please enter the email\n address linked with your account.",
          style: AppTextStyles.dmRegular16.copyWith(color: AppColors.mainGray),
        ),
      ],
    );
  }
}
