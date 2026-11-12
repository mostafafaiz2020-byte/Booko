import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/custom_text_field.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/ui/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  20.verticalSpace,

                  Row(
                    children: [
                      Container(
                        width: 41.w,
                        height: 41.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.outlineGray),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: 19.sp,
                          color: AppColors.black,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Search books',
                          autofocus: true,
                          onchange: (value) {
                            context.read<HomeCubit>().search(value ?? '');
                          },
                        ),
                      ),
                    ],
                  ),

                  20.verticalSpace,

                  Expanded(
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return Skeletonizer(
                            enabled: true,
                            child: GridView.builder(
                              itemCount: 8,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.67,
                                    mainAxisSpacing: 14.h,
                                    crossAxisSpacing: 12.w,
                                  ),
                              itemBuilder: (context, index) {
                                return BookCard(
                                  product: Products(
                                    name: 'Book name',
                                    price: '33',
                                    image:
                                        'https://i.pinimg.com/1200x/53/d6/93/53d69362d28551bcaf218d064224c474.jpg',
                                  ),
                                  isFavorite: false,
                                );
                              },
                            ),
                          );
                        }

                        if (state is SearchSuccess) {
                          final products = state.products ?? [];

                          if (products.isEmpty) {
                            return const Center(child: Text('No books found'));
                          }

                          return GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.67,
                                  mainAxisSpacing: 14.h,
                                  crossAxisSpacing: 12.w,
                                ),
                            itemBuilder: (context, index) {
                              return BookCard(
                                product: products[index],
                                isFavorite: false,
                              );
                            },
                          );
                        }

                        if (state is SearchError) {
                          return const Center(
                            child: Text('Something went wrong. Try again.'),
                          );
                        }

                        return const Center(child: Text('Search for a book'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
