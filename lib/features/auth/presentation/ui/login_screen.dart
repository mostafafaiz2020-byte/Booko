import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/widgets/validators.dart';
import 'package:bookia_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/ui/register_screen.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/auth_divider.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/auth_header.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/authfooter.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/custom_text_field.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/social_auth_button.dart';
import 'package:bookia_app/features/button_nav_bar/presentation/bottom_nave_bar_screen.dart';
import 'package:bookia_app/features/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/features/onboarding/presentation/ui/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthSuccess) {
          Navigator.of(context, rootNavigator: true).pop();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => BottomNaveBarScreen()),
          );
        } else if (state is AuthError) {
          Navigator.of(context, rootNavigator: true).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed. Check your email and password.'),
            ),
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(22.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 41.w,
                          height: 41.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.outlineGray),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios_new),
                            iconSize: 19.sp,
                            color: AppColors.black,
                          ),
                        ),
                        20.verticalSpace,
                        AuthHeader(
                          title: 'Welcome back! Glad to see you, Again!',
                        ),
                        20.verticalSpace,

                        CustomTextField(
                          controller: emailController,
                          hintText: 'Enter your email ',

                          //validator: AppValidators.email,
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          obscureText: true,
                          //validator: AppValidators.password,
                        ),
                        13.verticalSpace,
                        Text(
                          'Forgot password?',
                          style: AppTextStyles.dmRegular14.copyWith(
                            color: AppColors.mainGray,
                          ),
                        ),

                        30.verticalSpace,
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return OnboardingButton(
                              text: 'Login',
                              backgroundColor: AppColors.gold,
                              foregroundColor: AppColors.white,
                              onPressed: () {
                                if (isLoading) return;

                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );
                                }
                              },
                            );
                          },
                        ),
                        24.verticalSpace,
                        const AuthDivider(),
                        24.verticalSpace,

                        SocialAuthButton(
                          text: 'Sign Up with Google',
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.mainGray,
                          side: BorderSide(color: AppColors.outlineGray),
                          onPressed: () {},
                          imagePath: 'assets/image/logos_google-icon.png',
                        ),
                        15.verticalSpace,
                        SocialAuthButton(
                          text: 'Sign in with Apple',
                          imagePath: 'assets/image/apple.png',
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.mainGray,
                          side: BorderSide(color: AppColors.outlineGray),
                          onPressed: () {},
                        ),
                        50.verticalSpace,
                        AuthFooter(
                          message: 'Don’t have an account?',
                          actionText: 'Register Now',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
