import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomeHedar extends StatelessWidget {
  const CustomeHedar({super.key, required this.title, required this.iconData});

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(iconData, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Text(title, style: AppTextStyles.titleMedium),
        ],
      ),
    );
  }
}
