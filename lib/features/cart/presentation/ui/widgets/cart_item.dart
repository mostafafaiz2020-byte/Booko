import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/cart/presentation/ui/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.outlineGray),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              image,
              width: 94.w,
              height: 105.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 94.w,
                  height: 105.h,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.book),
                );
              },
            ),
          ),

          12.horizontalSpace,

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book name and remove button
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.dmRegular18.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                      height: 28.h,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onRemove,
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 20.r,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                8.verticalSpace,

                // Unit price
                Text(
                  'EGP ${price.toStringAsFixed(2)}',
                  style: AppTextStyles.dmRegular16.copyWith(
                    color: AppColors.black,
                  ),
                ),

                12.verticalSpace,

                // Quantity controls and total price
                Row(
                  children: [
                    QuantityButton(icon: Icons.add, onTap: onIncrease),

                    8.horizontalSpace,

                    Text('$quantity', style: AppTextStyles.dmRegular18),

                    8.horizontalSpace,

                    QuantityButton(icon: Icons.remove, onTap: onDecrease),

                    const Spacer(),

                    Flexible(
                      child: Text(
                        'EGP ${(price * quantity).toStringAsFixed(2)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: AppTextStyles.dmRegular14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
