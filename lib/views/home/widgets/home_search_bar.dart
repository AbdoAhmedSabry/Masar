import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  const HomeSearchBar({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.hintText,
            fontSize: 17,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.iconSecondary,
            size: 24,
          ),
          suffixIcon: suffixIcon == null
              ? null
              : Icon(suffixIcon, color: AppColors.iconSecondary, size: 24),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
