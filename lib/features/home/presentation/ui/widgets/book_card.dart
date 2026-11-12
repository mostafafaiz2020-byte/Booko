import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  final Products? product;
  final VoidCallback? onBuy;
  final VoidCallback? onTap;
  final VoidCallback? onAddToWishlist;
  final bool isFavorite;

  const BookCard({
    super.key,
    this.product,
    this.onBuy,
    this.onAddToWishlist,
    required this.isFavorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.outlineGray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      product?.image ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),

                  Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: IconButton(
                      onPressed: onAddToWishlist,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? AppColors.gold : AppColors.gold,
                        size: 25.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            8.verticalSpace,

            Text(
              product?.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.dmRegular18.copyWith(color: AppColors.black),
            ),

            8.verticalSpace,

            Row(
              children: [
                Expanded(
                  child: Text(
                    product?.price ?? "",
                    style: AppTextStyles.dmRegular15.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),

                SizedBox(
                  height: 28.h,
                  child: ElevatedButton(
                    onPressed: onBuy,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF292929),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: Text(
                      'Buy',
                      style: AppTextStyles.dmRegular14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
