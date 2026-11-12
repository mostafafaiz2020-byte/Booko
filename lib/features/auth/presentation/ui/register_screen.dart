import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/ui/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/auth_header.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/authfooter.dart';
import 'package:bookia_app/features/auth/presentation/ui/widgets/custom_text_field.dart';
import 'package:bookia_app/features/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/features/onboarding/presentation/ui/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
          Navigator.pop(context); // Close loading dialog

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        } else if (state is AuthError) {
          Navigator.pop(context); // Close loading dialog

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration failed. Please try again.'),
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
                        AuthHeader(title: 'Hello! Register to get started'),
                        20.verticalSpace,

                        CustomTextField(
                          controller: nameController,
                          hintText: 'Username ',

                          // validator: AppValidators.fullName,
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email ',
                          //validator: AppValidators.email,
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          // validator: AppValidators.password,
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm password',
                          obscureText: true,
                          // validator: AppValidators.password,
                        ),

                        30.verticalSpace,

                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;

                            return OnboardingButton(
                              text: 'Register',
                              backgroundColor: AppColors.gold,
                              foregroundColor: AppColors.white,
                              onPressed: () {
                                if (isLoading) return;

                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().register(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text,
                                    name: nameController.text.trim(),
                                  );
                                }
                              },
                            );
                          },
                        ),

                        90.verticalSpace,
                        AuthFooter(
                          message: 'Don’t have an account?',
                          actionText: 'Login Now',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
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
