import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle titleRegular = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkColor,
  );
  static TextStyle welcomeStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkColor,
  );

  static TextStyle hintTextStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.hintGrayColor,
  );
  static TextStyle bottonTextStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static TextStyle bookTitleStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.bookColor,
  );
}
