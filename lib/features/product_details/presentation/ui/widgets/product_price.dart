import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double? discountPrice;

  const ProductPrice({super.key, required this.price, this.discountPrice});

  @override
  Widget build(BuildContext context) {
    final hasDiscount = discountPrice != null && discountPrice! < price;

    return Row(
      children: [
        Text(
          'EGP ${(hasDiscount ? discountPrice! : price).toStringAsFixed(2)}',
          style: AppTextStyles.dmRegular24.copyWith(color: AppColors.gold),
        ),

        if (hasDiscount) ...[
          12.horizontalSpace,
          Text(
            'EGP ${price.toStringAsFixed(2)}',
            style: AppTextStyles.dmRegular20.copyWith(
              color: AppColors.gray80,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }
}
