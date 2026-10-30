import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
  const CustomeListTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.showArrow = false,
  });

  final Widget icon;
  final String title;
  final String? trailingText;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (showArrow) ...[
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.textSecondary,
            ),
          ],
        ],
      ),
      onTap: () {},
    );
  }
}
