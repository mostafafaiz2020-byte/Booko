import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/book_details/data/models/book_details_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsCoverView extends StatelessWidget {
  final Data? details;

  const BookDetailsCoverView({super.key, this.details});

  @override
  Widget build(BuildContext context) {
    final bool isBestSeller = (details?.bestSeller ?? 0) == 1;
    final int discount = details?.discount ?? 0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Ambient soft glow behind book
          Container(
            height: 230.h,
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.18),
                  blurRadius: 35,
                  spreadRadius: 2,
                  offset: const Offset(0, 14),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
          ),

          // Main Book Cover with Spine effect
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              height: 245.h,
              width: 170.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    details?.image ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu_book_rounded,
                              size: 48.sp,
                              color: AppColors.hintGrayColor,
                            ),
                            8.verticalSpace,
                            Text(
                              "No Cover Available",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.hintGrayColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          valueColor: const AlwaysStoppedAnimation(
                            AppColors.primaryColor,
                          ),
                        ),
                      );
                    },
                  ),

                  // Hardcover Book Spine 3D simulation
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 12.w,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.35),
                            Colors.black.withOpacity(0.08),
                            Colors.white.withOpacity(0.15),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.4, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // Subtle border overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.08),
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Best Seller Badge
          if (isBestSeller)
            Positioned(
              top: -6.h,
              left: -8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE5B942), Color(0xFFBFA054)],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFBFA054).withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star_rounded, size: 14.sp, color: Colors.white),
                    4.horizontalSpace,
                    Text(
                      "BEST SELLER",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Discount Badge
          if (discount > 0)
            Positioned(
              top: -6.h,
              right: -8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF5252), Color(0xFFD32F2F)],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF5252).withOpacity(0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "-$discount%",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
