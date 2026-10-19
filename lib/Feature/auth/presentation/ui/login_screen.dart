// Feature/auth/presentation/ui/login_screen.dart

// Feature/auth/presentation/ui/login_screen.dart

import 'package:bookstore/Core/routes/App_Routes.dart';
import 'package:bookstore/Core/theme/app_colors.dart';
import 'package:bookstore/Core/theme/app_text_styles.dart';
import 'package:bookstore/Core/utils/app_validator.dart';
import 'package:bookstore/Core/widgets/main_botton.dart';
import 'package:bookstore/Feature/auth/presentation/cubit/cubit/auth_cubit_cubit.dart';
import 'package:bookstore/Feature/auth/presentation/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formState = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: CircularProgressIndicator()),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushNamed(context, AppRoutes.welcome_screen);
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text("error")),
          );
        }
      },
      child: Form(
        key: formState,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.whitecolor,
            body: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.only(top: 11, left: 22, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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

                      const SizedBox(height: 30),

                      Text(
                        'Welcome back! Glad\nto see you, Again!',
                        style: AppTextStyles.text,
                      ),

                      const SizedBox(height: 30),

                      LoginForm(
                        controller: emailcontroller,
                        title: "Enter your email",
                        valdator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Email is required";
                          }

                          if (!AppValidator.isEmailValid(v)) {
                            return "please enter a email";
                          }

                          return "";
                        },
                      ),

                      const SizedBox(height: 20),

                      LoginForm(
                        controller: passwordcontroller,
                        title: "Enter your password",
                        isPassword: true,
                        valdator: (v) {
                          if (v == null || v.isEmpty) {
                            return "password is required";
                          }

                          if (v.length <= 6) {
                            return "password must be greater than 6";
                          }

                          return "";
                        },
                      ),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: AppTextStyles.font_hint,
                        ),
                      ),

                      15.verticalSpace,

                      MainBotton(
                        Titel: "login",
                        onTap: () {
                          if (formState.currentState!.validate() ?? false) {
                            context.read<AuthCubitCubit>().login(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                            );
                          }
                        },
                        backgroundColor: AppColors.maincolor,
                        textColor: AppColors.whitecolor,
                      ),

                      20.verticalSpace,

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.bordercolor,
                              thickness: 1,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 65),
                            child: Text('Or', style: AppTextStyles.font_hint),
                          ),

                          Expanded(
                            child: Divider(
                              color: AppColors.bordercolor,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      36.verticalSpace,

                      MainBotton(
                        Titel: "Sign in with Google",
                        onTap: () {},
                        backgroundColor: Colors.white,
                        textColor: const Color(0xFF737987),
                        image:
                            "https://img.icons8.com/color/48/google-logo.png",
                      ),

                      15.verticalSpace,

                      MainBotton(
                        Titel: "Sign in with Apple",
                        onTap: () {},
                        backgroundColor: Colors.white,
                        textColor: const Color(0xFF737987),
                        image:
                            "https://img.icons8.com/ios-filled/50/000000/mac-os.png",
                      ),

                      const SizedBox(height: 100),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              const TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(color: Color(0xFF303030)),
                              ),

                              TextSpan(
                                text: "Register Now",
                                style: TextStyle(color: AppColors.maincolor),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
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
