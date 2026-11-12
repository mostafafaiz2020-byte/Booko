import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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

        const Spacer(),
        Center(
          child: Text(
            'Book Details',
            style: AppTextStyles.dmRegular24.copyWith(color: AppColors.black),
          ),
        ),

        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icon/Bookmark.svg'),
        ),
      ],
    );
  }
}
