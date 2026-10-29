import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_validator.dart';
import 'package:bookia/core/widgets/app_botton.dart';
import 'package:bookia/core/widgets/custom_text_form_feild.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLodinState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              content: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is RegisterSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else if (state is RegisterErrorState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(content: Text("Error")),
          );
        }
      },
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextFormFeild(
              hintText: "User name",
              controller: userNameController,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return "User name is required";
                } else if (v.trim().length < 3) {
                  return "User name must be at least 3 characters";
                }
                return null;
              },
            ),
            15.verticalSpace,
            CustomTextFormFeild(
              controller: emailController,
              hintText: "Email",
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Email is required";
                }
                if (!AppValidator.isEmailValid(v)) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            15.verticalSpace,
            CustomTextFormFeild(
              controller: passwordController,
              hintText: "Password",
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Password is required";
                } else if (v.length <= 6) {
                  return "Password must be greater than 6 char";
                }
                return null;
              },
            ),
            15.verticalSpace,
            CustomTextFormFeild(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Confirm password is required";
                } else if (v != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            30.verticalSpace,
            AppBotton(
              title: "Register",
              onTap: () {
                if (formState.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(
                    username: userNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
