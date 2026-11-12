import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_app/features/product_details/presentation/cubit/cubit/product_details_cubit.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/product_header.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/product_image.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/product_info.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/product_price.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/product_description.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/product_stock.dart';
import 'package:bookia_app/features/product_details/presentation/ui/widgets/add_to_cart_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider(
        create: (_) => ProductDetailsCubit()..getProductDetails(productId),
        child: Scaffold(
          backgroundColor: AppColors.backGround,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  child: const ProductHeader(),
                ),

                Expanded(
                  child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    builder: (context, state) {
                      if (state is ProductDetailsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ProductDetailsError) {
                        return Center(child: Text(state.message));
                      }

                      if (state is ProductDetailsSuccess) {
                        final product = state.product;

                        if (product == null) {
                          return const Center(child: Text('Product not found'));
                        }

                        final price =
                            double.tryParse(product.price ?? '0') ?? 0;

                        return SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductImage(image: product.image ?? ''),

                              25.verticalSpace,

                              ProductInfo(
                                name: product.name ?? '',
                                category: product.category ?? '',
                              ),

                              18.verticalSpace,

                              ProductPrice(
                                price: price,
                                discountPrice: product.priceAfterDiscount,
                              ),

                              25.verticalSpace,

                              ProductDescription(
                                description: product.description ?? '',
                              ),

                              25.verticalSpace,

                              ProductStock(stock: product.stock ?? 0),

                              25.verticalSpace,

                              AddToCartButton(
                                onPressed: () async {
                                  final id = product.id;
                                  if (id == null) return;

                                  final success = await context
                                      .read<CartCubit>()
                                      .addToCart(id);

                                  if (!context.mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        success
                                            ? 'Book added to cart successfully'
                                            : 'Failed to add book to cart',
                                      ),
                                    ),
                                  );
                                },
                              ),

                              20.verticalSpace,
                            ],
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
