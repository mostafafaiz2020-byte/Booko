import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 41.h,
        width: 41.w,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.borderSideColor),
        ),
        child: Center(
          child: Image.asset(
            "assets/icons/Vector.png",
            // width: 8.5.w,
            // height: 14.86.h,
          ),
        ),
      ),
    );
  }
}
