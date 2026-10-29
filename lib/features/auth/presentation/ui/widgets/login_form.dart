import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:bookia/core/utils/app_validator.dart';
import 'package:bookia/core/widgets/app_botton.dart';
import 'package:bookia/core/widgets/custom_text_form_feild.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLodinState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              content: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else if (state is LoginErrorState) {
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
              controller: emailController,
              hintText: "Enter Your Email",
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Email is required";
                }
                if (!AppValidator.isEmailValid(v ?? "")) {
                  return "Please enter a valid email";
                }
              },
            ),
            15.verticalSpace,
            CustomTextFormFeild(
              controller: passwordController,
              hintText: "Enter Your Password",
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Password is required";
                } else if (v.length <= 6) {
                  return "Password must be greater than 6 char";
                }
              },
              isPassword: true,
            ),
            13.verticalSpace,
            InkWell(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                style: AppTextStyles.hintTextStyle,
              ),
            ),
            30.verticalSpace,
            AppBotton(
              title: "Login",
              onTap: () {
                if (formState.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().login(
                    email: emailController.text,
                    password: passwordController.text,
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
