import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/core/services/locale/local_helper.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/utils/app_const.dart';
import 'package:bookia_app/features/onboarding/presentation/ui/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: SizedBox(
        height: 40.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Profile',
              style: AppTextStyles.dmRegular24.copyWith(color: AppColors.black),
            ),

            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: AppColors.backGround,
                      title: Center(
                        child: Text(
                          'You want to log out',
                          style: AppTextStyles.dmRegular20.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),

                      content: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: OnboardingButton(
                                backgroundColor: AppColors.gold,
                                foregroundColor: AppColors.white,
                                text: "Cancel",
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: OnboardingButton(
                                backgroundColor: Colors.transparent,
                                foregroundColor: AppColors.black,
                                text: "Confirm",
                                onPressed: () async {
                                  await LocalHelper.prefs?.remove(
                                    AppConst.userToken,
                                  );

                                  if (!context.mounted) return;

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutes.loginScreen,
                                    (route) => false,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset('assets/icon/Logout.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
