import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_app/features/cart/presentation/ui/widgets/cart_bottom_bar.dart';
import 'package:bookia_app/features/cart/presentation/ui/widgets/cart_item.dart';
import 'package:bookia_app/features/checkout/presentation/ui/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SafeArea(
        child: Column(
          children: [
            25.verticalSpace,

            Text(
              'My Cart',
              style: AppTextStyles.dmRegular24.copyWith(color: AppColors.black),
            ),

            25.verticalSpace,

            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CartError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(state.message),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CartCubit>().getCartData();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is CartSuccess) {
                    final items = state.cartData?.cartItems ?? [];

                    if (items.isEmpty) {
                      return const Center(child: Text('Your Cart Is Empty'));
                    }

                    return ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      itemCount: items.length,
                      separatorBuilder: (context, index) {
                        return 12.verticalSpace;
                      },
                      itemBuilder: (context, index) {
                        final item = items[index];

                        final price =
                            item.itemProductPriceAfterDiscount ??
                            double.tryParse(item.itemProductPrice ?? '0') ??
                            0.0;

                        return CartItem(
                          name: item.itemProductName ?? '',
                          image: item.itemProductImage ?? '',
                          price: price,
                          quantity: item.itemQuantity ?? 1,

                          onIncrease: () {
                            final currentQuantity = item.itemQuantity ?? 1;

                            if (currentQuantity <
                                (item.itemProductStock ?? 0)) {
                              context.read<CartCubit>().updateCart(
                                cartItemId: item.itemId!,
                                quantity: currentQuantity + 1,
                              );
                            }
                          },

                          onDecrease: () {
                            final currentQuantity = item.itemQuantity ?? 1;

                            if (currentQuantity > 1) {
                              context.read<CartCubit>().updateCart(
                                cartItemId: item.itemId!,
                                quantity: currentQuantity - 1,
                              );
                            }
                          },

                          onRemove: () {
                            final itemId = item.itemId;

                            if (itemId != null) {
                              context.read<CartCubit>().removeFromCart(itemId);
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

            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final total = state is CartSuccess
                    ? double.tryParse(state.cartData?.total ?? '0') ?? 0.0
                    : 0.0;

                return CartBottomBar(
                  total: total,
                  onCheckout: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckoutScreen(total: total),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
