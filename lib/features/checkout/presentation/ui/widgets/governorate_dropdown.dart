import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GovernorateDropdown extends StatelessWidget {
  final String? selectedGovernorate;
  final ValueChanged<String?> onChanged;

  const GovernorateDropdown({
    super.key,
    required this.selectedGovernorate,
    required this.onChanged,
  });

  final List<String> governorates = const [
    'Cairo',
    'Giza',
    'Alexandria',
    'Qalyubia',
    'Dakahlia',
    'Gharbia',
    'Monufia',
    'Sharqia',
    'Beheira',
    'Kafr El Sheikh',
    'Damietta',
    'Port Said',
    'Ismailia',
    'Suez',
    'North Sinai',
    'South Sinai',
    'Faiyum',
    'Beni Suef',
    'Minya',
    'Asyut',
    'Sohag',
    'Qena',
    'Luxor',
    'Aswan',
    'Red Sea',
    'New Valley',
    'Matrouh',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedGovernorate,
      dropdownColor: AppColors.white,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.mainGray,
        size: 25.r,
      ),
      hint: Text(
        'Governorate',
        style: AppTextStyles.dmRegular15.copyWith(color: AppColors.mainGray),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.outlineGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.outlineGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.gold),
        ),
      ),
      items: governorates.map((governorate) {
        return DropdownMenuItem<String>(
          value: governorate,
          child: Text(
            governorate,
            style: AppTextStyles.dmRegular15.copyWith(color: AppColors.black),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
