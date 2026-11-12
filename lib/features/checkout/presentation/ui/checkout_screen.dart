import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/widgets/validators.dart';
import 'package:bookia_app/features/checkout/presentation/ui/submit_screen.dart';
import 'package:bookia_app/features/checkout/presentation/ui/widgets/checkout_header.dart';
import 'package:bookia_app/features/checkout/presentation/ui/widgets/checkout_text_field.dart';
import 'package:bookia_app/features/checkout/presentation/ui/widgets/governorate_dropdown.dart';
import 'package:bookia_app/features/checkout/presentation/ui/widgets/submit_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatefulWidget {
  final double total;

  const CheckoutScreen({super.key, required this.total});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? selectedGovernorate;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void submitOrder() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (selectedGovernorate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your governorate')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SubmitScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColors.backGround,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.verticalSpace,

                  const CheckoutHeader(),

                  30.verticalSpace,

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CheckoutTextField(
                          hintText: 'Full Name',
                          controller: nameController,
                          validator: AppValidators.fullName,
                        ),

                        15.verticalSpace,

                        CheckoutTextField(
                          hintText: 'Address',
                          controller: addressController,
                          validator: AppValidators.address,
                        ),

                        15.verticalSpace,

                        CheckoutTextField(
                          hintText: 'Phone Number',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: AppValidators.phone,
                        ),
                      ],
                    ),
                  ),

                  15.verticalSpace,

                  GovernorateDropdown(
                    selectedGovernorate: selectedGovernorate,
                    onChanged: (value) {
                      setState(() {
                        selectedGovernorate = value;
                      });
                    },
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: AppTextStyles.dmRegular20.copyWith(
                          color: AppColors.gray80,
                        ),
                      ),

                      Text(
                        'EGP ${widget.total.toStringAsFixed(2)}',
                        style: AppTextStyles.dmRegular20.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),

                  20.verticalSpace,

                  SubmitOrderButton(
                    onPressed: submitOrder,
                    text: 'Submit Order',
                  ),

                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
