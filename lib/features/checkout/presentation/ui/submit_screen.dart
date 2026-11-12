import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/button_nav_bar/presentation/bottom_nave_bar_screen.dart';
import 'package:bookia_app/features/checkout/presentation/ui/widgets/submit_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              const Spacer(flex: 3),

              Image.asset('assets/image/Successmark.png'),

              25.verticalSpace,

              Text(
                '!SUCCESS',
                style: AppTextStyles.dmRegular36.copyWith(
                  color: AppColors.black,
                ),
              ),

              12.verticalSpace,

              Text(
                'Your order will be delivered soon\n!Thank you for choosing our app',
                textAlign: TextAlign.center,
                style: AppTextStyles.dmRegular18.copyWith(
                  color: AppColors.gray60,
                ),
              ),

              40.verticalSpace,

              SubmitOrderButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNaveBarScreen(),
                    ),
                    (route) => false,
                  );
                },
                text: 'Back To Home',
              ),

              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
