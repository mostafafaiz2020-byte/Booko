import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/ui/widgets/book_card.dart';
import 'package:bookia_app/features/home/presentation/ui/widgets/home_banner.dart';
import 'package:bookia_app/features/home/presentation/ui/widgets/home_header.dart';
import 'package:bookia_app/features/product_details/presentation/ui/product_details_screen.dart';
import 'package:bookia_app/features/wishlist/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onNavigateToCart;
  const HomeScreen({super.key, this.onNavigateToCart});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8F9),
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),

              20.verticalSpace,

              const HomeBanner(),

              30.verticalSpace,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Best Seller',
                    style: AppTextStyles.dmRegular24.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),

              12.verticalSpace,

              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is GetBestSellerLoading ||
                      current is GetBestSellerSuccess ||
                      current is GetBestSellerError,
                  builder: (context, state) {
                    if (state is GetBestSellerLoading) {
                      return Skeletonizer(
                        enabled: true,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.67,
                                mainAxisSpacing: 14.h,
                                crossAxisSpacing: 12.w,
                              ),
                          itemBuilder: (context, index) => BookCard(
                            product: Products(
                              name: 'name',
                              price: '33',
                              image:
                                  'https://i.pinimg.com/1200x/53/d6/93/53d69362d28551bcaf218d064224c474.jpg',
                            ),
                            isFavorite: false,
                          ),
                        ),
                      );
                    } else if (state is GetBestSellerSuccess) {
                      final products = state.products ?? [];

                      if (products.isEmpty) {
                        return const Center(child: Text('No books found'));
                      }

                      return BlocBuilder<WishlistCubit, WishlistState>(
                        builder: (context, wishlistState) {
                          final wishlistProducts =
                              wishlistState is WishlistSuccess
                              ? wishlistState.wishlistData?.products ?? []
                              : [];

                          return GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.67,
                                  mainAxisSpacing: 14.h,
                                  crossAxisSpacing: 12.w,
                                ),
                            itemBuilder: (context, index) {
                              final product = products[index];

                              final isFavorite = wishlistProducts.any(
                                (item) => item.id == product.id,
                              );

                              return BookCard(
                                product: product,
                                isFavorite: isFavorite,
                                onTap: () {
                                  final productId = product.id;

                                  if (productId == null) return;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: context.read<CartCubit>(),
                                        child: ProductDetailsScreen(
                                          productId: productId,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                onBuy: () async {
                                  final productId = product.id;
                                  if (productId == null) return;

                                  final success = await context
                                      .read<CartCubit>()
                                      .addToCart(productId);

                                  if (!context.mounted) return;

                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Book added to cart successfully',
                                        ),
                                      ),
                                    );

                                    onNavigateToCart?.call();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Failed to add book to cart',
                                        ),
                                      ),
                                    );
                                  }
                                },

                                onAddToWishlist: () async {
                                  final productId = product.id;
                                  if (productId == null) return;

                                  final cubit = context.read<WishlistCubit>();

                                  final success = isFavorite
                                      ? await cubit.removeFromWishlist(
                                          productId,
                                        )
                                      : await cubit.addToWishlist(productId);

                                  if (!context.mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        success
                                            ? (isFavorite
                                                  ? 'Book removed from Wishlist'
                                                  : 'Book added to Wishlist successfully')
                                            : 'Wishlist operation failed',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else if (state is GetBestSellerError) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_off_rounded,
                                size: 65.sp,
                                color: Colors.grey,
                              ),

                              20.verticalSpace,

                              Text(
                                'Oops! Something went wrong',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.dmRegular20.copyWith(
                                  color: AppColors.black,
                                ),
                              ),

                              10.verticalSpace,

                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.dmRegular14.copyWith(
                                  color: AppColors.gray80,
                                ),
                              ),

                              25.verticalSpace,

                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<HomeCubit>()
                                      .getBestSellerBooks();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.gold,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 35.w,
                                    vertical: 12.h,
                                  ),
                                ),
                                child: const Text('Try Again'),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
