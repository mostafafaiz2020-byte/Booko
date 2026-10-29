import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/book_details/data/models/book_details_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsBottomBar extends StatefulWidget {
  final Data? details;
  final void Function(int quantity)? onAddToCart;

  const BookDetailsBottomBar({
    super.key,
    this.details,
    this.onAddToCart,
  });

  @override
  State<BookDetailsBottomBar> createState() => _BookDetailsBottomBarState();
}

class _BookDetailsBottomBarState extends State<BookDetailsBottomBar> {
  int quantity = 1;

  double _parsePrice(String? priceStr) {
    if (priceStr == null || priceStr.isEmpty) return 0.0;
    final cleaned = priceStr.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final int stock = widget.details?.stock ?? 10;
    final bool isOutOfStock = stock <= 0;

    final double originalUnitPrice = _parsePrice(widget.details?.price);
    final double? discountedUnitPrice = widget.details?.priceAfterDiscount;

    final double activeUnitPrice = discountedUnitPrice ?? originalUnitPrice;
    final double totalPrice = activeUnitPrice * quantity;
    final double totalOriginalPrice = originalUnitPrice * quantity;

    final bool hasDiscount =
        discountedUnitPrice != null && discountedUnitPrice < originalUnitPrice;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Quantity row & unit badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.borderSideColor),
                  ),
                  child: Row(
                    children: [
                      _buildQuantityButton(
                        icon: Icons.remove,
                        enabled: quantity > 1 && !isOutOfStock,
                        onTap: () {
                          if (quantity > 1) {
                            setState(() => quantity--);
                          }
                        },
                      ),
                      Container(
                        constraints: BoxConstraints(minWidth: 36.w),
                        alignment: Alignment.center,
                        child: Text(
                          "$quantity",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ),
                      _buildQuantityButton(
                        icon: Icons.add,
                        enabled: (quantity < stock || stock == 0) && !isOutOfStock,
                        onTap: () {
                          if (stock == 0 || quantity < stock) {
                            setState(() => quantity++);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            14.verticalSpace,

            // Price and Action Button Row
            Row(
              children: [
                // Price section
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.hintGrayColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      2.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "£${totalPrice.toStringAsFixed(1)}",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkColor,
                            ),
                          ),
                          if (hasDiscount) ...[
                            6.horizontalSpace,
                            Text(
                              "£${totalOriginalPrice.toStringAsFixed(1)}",
                              style: TextStyle(
                                fontSize: 13.sp,
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.hintGrayColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),

                12.horizontalSpace,

                // Add to Cart button
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: isOutOfStock
                          ? null
                          : () {
                              if (widget.onAddToCart != null) {
                                widget.onAddToCart!(quantity);
                              } else {
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                        ),
                                        10.horizontalSpace,
                                        Expanded(
                                          child: Text(
                                            "Added $quantity ${quantity > 1 ? 'copies' : 'copy'} to your Cart!",
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    backgroundColor: AppColors.darkColor,
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isOutOfStock
                            ? Colors.grey.shade400
                            : AppColors.bookColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 19.sp,
                            color: Colors.white,
                          ),
                          8.horizontalSpace,
                          Flexible(
                            child: Text(
                              isOutOfStock ? "Out of Stock" : "Add To Cart",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: enabled ? AppColors.whiteColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          icon,
          size: 16.sp,
          color: enabled ? AppColors.darkColor : Colors.grey.shade400,
        ),
      ),
    );
  }
}
