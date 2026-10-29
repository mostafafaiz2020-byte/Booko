import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/book_details/data/models/book_details_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsHeader extends StatefulWidget {
  final Data? details;

  const BookDetailsHeader({super.key, this.details});

  @override
  State<BookDetailsHeader> createState() => _BookDetailsHeaderState();
}

class _BookDetailsHeaderState extends State<BookDetailsHeader> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ArrowBack(),
        Text(
          "Book Details",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      widget.details?.name != null
                          ? "Sharing \"${widget.details?.name}\"..."
                          : "Sharing book...",
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                );
              },
              child: Container(
                height: 41.h,
                width: 41.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.borderSideColor),
                ),
                child: Icon(
                  Icons.share_outlined,
                  size: 20.sp,
                  color: AppColors.darkColor,
                ),
              ),
            ),
            10.horizontalSpace,
            InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                });
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          isBookmarked
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_remove_outlined,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                        10.horizontalSpace,
                        Text(
                          isBookmarked
                              ? "Saved to your Wishlist"
                              : "Removed from Wishlist",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 41.h,
                width: 41.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: isBookmarked
                      ? AppColors.primaryColor.withOpacity(0.12)
                      : AppColors.whiteColor,
                  border: Border.all(
                    color: isBookmarked
                        ? AppColors.primaryColor
                        : AppColors.borderSideColor,
                  ),
                ),
                child: Icon(
                  isBookmarked
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  size: 22.sp,
                  color: isBookmarked
                      ? AppColors.primaryColor
                      : AppColors.darkColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
