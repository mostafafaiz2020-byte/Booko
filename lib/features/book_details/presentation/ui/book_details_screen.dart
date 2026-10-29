import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_bottom_bar.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_cover_view.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_description.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_error_view.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_header.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_meta_row.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/book_details_skeleton.dart';
import 'package:bookia/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  final int? bookId;

  const BookDetailsScreen({super.key, this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<BookDetailsCubit, BookDetailsState>(
        builder: (context, state) {
          if (state is GetBookDetailsLoading || state is BookDetailsInitial) {
            return const BookDetailsSkeleton();
          } else if (state is GetBookDetailsSuccess) {
            final details = state.details;

            return SafeArea(
              child: Column(
                children: [
                  11.verticalSpace,
                  // Top navigation & actions
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: BookDetailsHeader(details: details),
                  ),

                  // Scrollable Content
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            20.verticalSpace,

                            // Realistic elevated 3D book cover with badges
                            BookDetailsCoverView(details: details),
                            20.verticalSpace,

                            // Book Title
                            Text(
                              details?.name ?? "Book Title",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: FontFamily.dm,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor,
                                height: 1.25,
                              ),
                            ),
                            8.verticalSpace,

                            // Category Chip
                            if (details?.category != null &&
                                details!.category!.isNotEmpty)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor.withOpacity(
                                    0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  details.category!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),

                            20.verticalSpace,

                            // Key Stats & Highlights Row (Rating, Stock, Genre, Format)
                            BookDetailsMetaRow(details: details),

                            22.verticalSpace,

                            // Expandable Synopsis / Overview
                            BookDetailsDescription(
                              description: details?.description,
                            ),

                            24.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Fixed Bottom Bar with Quantity Selector and Add to Cart
                  BookDetailsBottomBar(details: details),
                ],
              ),
            );
          } else {
            return BookDetailsErrorView(
              onRetry: () {
                if (bookId != null) {
                  context.read<BookDetailsCubit>().getDetails(bookId!);
                }
              },
            );
          }
        },
      ),
    );
  }
}
