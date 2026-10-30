import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Center(
        // لضمان توسيط الحقل عمودياً داخل الكنتينر
        child: TextField(
          obscureText: hintText == 'Password',
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
            // إلغاء كل الحدود الداخلية تماماً ليعتمد الحقل على إطار الكنتينر الخارجي فقط
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16, // تم تعديلها قليلاً لتتوسط الارتفاع 64 بشكل مثالي
            ),
          ),
        ),
      ),
    );
  }
}
