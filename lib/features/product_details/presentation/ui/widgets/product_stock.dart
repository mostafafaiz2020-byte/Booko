import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductStock extends StatelessWidget {
  final int stock;

  const ProductStock({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Available Stock: $stock',
      style: AppTextStyles.dmRegular16.copyWith(color: AppColors.gold),
    );
  }
}
