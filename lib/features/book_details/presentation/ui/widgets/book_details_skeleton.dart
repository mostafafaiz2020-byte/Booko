import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookDetailsSkeleton extends StatelessWidget {
  const BookDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Skeletonizer(
          enabled: true,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ArrowBack(),
                    Text(
                      "Book Details",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 41.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.grey.shade300,
                          ),
                        ),
                        10.horizontalSpace,
                        Container(
                          height: 41.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Column(
                    children: [
                      16.verticalSpace,
                      // Book Cover
                      Center(
                        child: Container(
                          height: 240.h,
                          width: 165.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      // Title
                      Container(
                        height: 26.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      10.verticalSpace,
                      // Category Chip
                      Container(
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      22.verticalSpace,
                      // Stats Row
                      Container(
                        height: 70.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Colors.grey.shade200,
                        ),
                      ),
                      24.verticalSpace,
                      // Description Header & Lines
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 18.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      12.verticalSpace,
                      Container(
                        height: 14.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.grey.shade200,
                        ),
                      ),
                      8.verticalSpace,
                      Container(
                        height: 14.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.grey.shade200,
                        ),
                      ),
                      8.verticalSpace,
                      Container(
                        height: 14.h,
                        width: 240.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom bar skeleton
              Container(
                height: 90.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: AppColors.borderSideColor),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 80.w,
                      color: Colors.grey.shade300,
                    ),
                    const Spacer(),
                    Container(
                      height: 48.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
