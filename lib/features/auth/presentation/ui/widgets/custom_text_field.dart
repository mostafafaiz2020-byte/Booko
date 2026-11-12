import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool showValidation;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final void Function(String?)? onchange;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.showValidation = false,
    this.controller,
    this.keyboardType,
    this.autofocus,
    this.onchange,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onchange,
      autofocus: widget.autofocus ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText && !isPasswordVisible,
      validator: widget.validator,
      autovalidateMode: widget.showValidation
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.dmRegular15.copyWith(
          color: AppColors.mainGray,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.mainGray,
                ),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.outlineGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.gold),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.Red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.Red),
        ),
      ),
    );
  }
}
