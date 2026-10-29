import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBotton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? titleColor;
  final void Function() onTap;

  const AppBotton({
    super.key,
    required this.title,
    required this.onTap,
    this.bgColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: bgColor ?? AppColors.primaryColor,
        ),
        child: Text(
          title,
          style: AppTextStyles.bottonTextStyle.copyWith(
            color: titleColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
