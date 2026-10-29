import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:bookia/features/home/data/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final Products? product;
  const BookItem({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.bookDetailsScreen,
          arguments: product?.id,
        );
      },
      child: Container(
        // height: 281.h,
        width: 163.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.borderSideColor),
        ),
        child: Padding(
          padding: EdgeInsets.all(11.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  product?.image ?? "",
                  height: 175.4.h,
                  width: 140.9.w,
                  fit: BoxFit.cover,
                ),
              ),
              20.verticalSpace,
              Text(
                product?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bookTitleStyle,
              ),
              8.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product?.price ?? "",
                      style: AppTextStyles.bookTitleStyle.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: 72.23.w,
                    height: 27.9.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.bookColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      "Buy",
                      style: AppTextStyles.bookTitleStyle.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
