import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/wishlist/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:bookia_app/features/wishlist/presentation/ui/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SafeArea(
        child: Column(
          children: [
            25.verticalSpace,

            Text(
              'Wishlist',
              style: AppTextStyles.dmRegular24.copyWith(color: AppColors.black),
            ),

            25.verticalSpace,

            Expanded(
              child: BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is WishlistError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(state.message),
                          10.verticalSpace,
                          ElevatedButton(
                            onPressed: () {
                              context.read<WishlistCubit>().getWishlist();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is WishlistSuccess) {
                    final products = state.wishlistData?.products ?? [];

                    if (products.isEmpty) {
                      return const Center(
                        child: Text('Your Wishlist Is Empty'),
                      );
                    }

                    return GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 0.58,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return WishlistItem(
                          product: product,
                          onRemove: () async {
                            final productId = product.id;

                            if (productId == null) return;

                            final success = await context
                                .read<WishlistCubit>()
                                .removeFromWishlist(productId);

                            if (!context.mounted) return;

                            if (!success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to remove book'),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
