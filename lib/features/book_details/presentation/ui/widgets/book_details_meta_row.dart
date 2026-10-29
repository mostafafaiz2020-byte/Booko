import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/book_details/data/models/book_details_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsMetaRow extends StatelessWidget {
  final Data? details;

  const BookDetailsMetaRow({super.key, this.details});

  @override
  Widget build(BuildContext context) {
    final int stock = details?.stock ?? 0;
    final bool inStock = stock > 0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.borderSideColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Rating Card
          _buildMetaItem(
            icon: Icons.star_rounded,
            iconColor: const Color(0xFFFFB800),
            title: "4.8",
            subtitle: "Reviews",
          ),
          _buildDivider(),

          // Stock Status
          _buildMetaItem(
            icon: inStock
                ? Icons.check_circle_outline_rounded
                : Icons.cancel_outlined,
            iconColor: inStock
                ? const Color(0xFF2E7D32)
                : const Color(0xFFC62828),
            title: inStock ? (stock > 10 ? "In Stock" : "$stock Left") : "Sold Out",
            subtitle: "Availability",
          ),
          _buildDivider(),

          // Category / Genre
          _buildMetaItem(
            icon: Icons.auto_stories_outlined,
            iconColor: AppColors.primaryColor,
            title: (details?.category?.isNotEmpty ?? false)
                ? details!.category!
                : "General",
            subtitle: "Category",
            maxWidth: 75.w,
          ),
          _buildDivider(),

          // Format / Pages
          _buildMetaItem(
            icon: Icons.language_rounded,
            iconColor: const Color(0xFF4A90E2),
            title: "English",
            subtitle: "Language",
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 32.h,
      width: 1,
      color: AppColors.borderSideColor,
    );
  }

  Widget _buildMetaItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    double? maxWidth,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16.sp, color: iconColor),
            4.horizontalSpace,
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth ?? 70.w),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.hintGrayColor,
          ),
        ),
      ],
    );
  }
}
