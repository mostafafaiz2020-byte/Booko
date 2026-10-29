import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final bool isSearch;
  final bool autofocus;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.isSearch = false,
    this.autofocus = false,
    this.onChanged,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      controller: widget.controller,
      obscureText: widget.isPassword && isObscureText,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      onChanged: widget.onChanged,
      validator: widget.validator,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        hintText: widget.hintText,
        prefixIcon: widget.isSearch ? Icon(Icons.search) : null,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(Icons.visibility),
              )
            : null,
        hintStyle: AppTextStyles.hintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.borderSideColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.borderSideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
