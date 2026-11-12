import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  String _removeHtmlTags(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyles.dmRegular20.copyWith(color: AppColors.black),
        ),

        10.verticalSpace,

        Text(
          _removeHtmlTags(description),
          style: AppTextStyles.dmRegular16.copyWith(
            color: AppColors.gray80,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
