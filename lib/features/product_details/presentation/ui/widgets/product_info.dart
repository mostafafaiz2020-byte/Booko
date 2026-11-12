import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfo extends StatelessWidget {
  final String name;
  final String category;

  const ProductInfo({super.key, required this.name, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.dmRegular30.copyWith(color: AppColors.black),
          ),
        ),

        10.verticalSpace,

        Center(
          child: Text(
            category,
            style: AppTextStyles.dmRegular15.copyWith(color: AppColors.gold),
          ),
        ),
      ],
    );
  }
}
