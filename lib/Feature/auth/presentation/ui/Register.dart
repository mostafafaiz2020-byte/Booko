// Feature/auth/presentation/ui/Register.dart
import 'package:bookstore/Core/theme/app_colors.dart';
import 'package:bookstore/Core/theme/app_text_styles.dart';
import 'package:bookstore/Core/widgets/Custom%20TextFormField.dart';
import 'package:bookstore/Core/widgets/main_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 11,
                        left: 22,
                        right: 22,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back Button
                          Container(
                            width: 62,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.bordercolor),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 25,
                              color: Color(0xFF303030),
                            ),
                          ),

                          const SizedBox(height: 48),

                          // Register Title
                          Text(
                            'Hello! Register to get\nstarted',
                            style: AppTextStyles.text,
                          ),

                          const SizedBox(height: 46),

                          // Username
                          CustomTextField(hint: 'Username'),

                          15.verticalSpace,

                          // Email
                          CustomTextField(hint: 'Email'),

                          15.verticalSpace,

                          // Password
                          CustomTextField(hint: 'Password', isPassword: false),

                          15.verticalSpace,

                          // Confirm Password
                          CustomTextField(
                            hint: 'Confirm password',
                            isPassword: false,
                          ),

                          34.verticalSpace,

                          // Register Button
                          MainBotton(
                            Titel: "Register",
                            onTap: () {},
                            backgroundColor: AppColors.maincolor,
                            textColor: AppColors.whitecolor,
                          ),

                          const Spacer(),

                          // Login Text
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(color: Color(0xFF303030)),
                                  ),

                                  TextSpan(
                                    text: "Login Now",
                                    style: TextStyle(
                                      color: AppColors.maincolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
