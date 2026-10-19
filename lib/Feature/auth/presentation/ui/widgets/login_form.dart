// Feature/auth/presentation/ui/widgets/login_form.dart

// Feature/auth/presentation/ui/widgets/login_form.dart

import 'package:bookstore/Core/theme/app_colors.dart';
import 'package:bookstore/Core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  final String title;
  final bool isPassword;
  final String Function(String?)? valdator;

  const LoginForm({
    super.key,
    required this.title,
    this.isPassword = false,
    this.valdator,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,

      obscureText: widget.isPassword && isobscure, //بنستخدمها علشان نخفي النص
      cursorColor: AppColors.maincolor,
      validator: widget.valdator,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
                child: const Icon(Icons.visibility),
              )
            : null,
        hintStyle: AppTextStyles.font_hint,
        hintText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.bordercolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.bordercolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.bordercolor),
        ),
      ),
    );
  }
}
