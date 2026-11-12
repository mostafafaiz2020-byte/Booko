import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItem extends StatelessWidget {
  final Products product;
  final VoidCallback onRemove;

  const WishlistItem({
    super.key,
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final price =
        product.priceAfterDiscount ??
        double.tryParse(product.price ?? '0') ??
        0.0;

    return Container(
      padding: EdgeInsets.all(9.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.outlineGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 175,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.gray80,
                      child: const Center(child: Icon(Icons.book, size: 35)),
                    );
                  },
                ),
              ),
            ),
          ),

          7.verticalSpace,

          Text(
            product.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.dmRegular18.copyWith(color: AppColors.black),
          ),

          10.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${price.toStringAsFixed(0)}',
                style: AppTextStyles.dmRegular16.copyWith(
                  color: AppColors.black,
                ),
              ),

              InkWell(
                onTap: onRemove,
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: 20.r,
                  height: 20.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.black, width: 1.2),
                  ),
                  child: Icon(Icons.close, size: 16.r, color: AppColors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
