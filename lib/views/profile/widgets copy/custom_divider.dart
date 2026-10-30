import 'package:elearning/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.divider,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      height: 1,
    );
  }
}
