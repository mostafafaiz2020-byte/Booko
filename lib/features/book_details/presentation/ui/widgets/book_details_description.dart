import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsDescription extends StatefulWidget {
  final String? description;

  const BookDetailsDescription({super.key, this.description});

  @override
  State<BookDetailsDescription> createState() => _BookDetailsDescriptionState();
}

class _BookDetailsDescriptionState extends State<BookDetailsDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String text = widget.description?.trim().isNotEmpty == true
        ? widget.description!
        : "No synopsis available for this book.";

    final bool isLongText = text.length > 160;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3.5.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            8.horizontalSpace,
            Text(
              "About the Book",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.darkColor,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: Alignment.topLeft,
          child: Text(
            text,
            maxLines: (!isExpanded && isLongText) ? 4 : null,
            overflow: (!isExpanded && isLongText)
                ? TextOverflow.ellipsis
                : TextOverflow.visible,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 13.5.sp,
              height: 1.7,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF555B68),
            ),
          ),
        ),
        if (isLongText)
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isExpanded ? "Show Less" : "Read More",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  4.horizontalSpace,
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 18.sp,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
