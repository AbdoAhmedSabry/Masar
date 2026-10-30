import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CourseCardWidget extends StatelessWidget {
  final String courseImageUrl;
  final String title;
  final String description;
  final String instructorName;
  final String instructorImageUrl;

  const CourseCardWidget({
    Key? key,
    required this.courseImageUrl,
    required this.title,
    required this.description,
    required this.instructorName,
    required this.instructorImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4), // ظل خفيف جداً لإبراز الكارت
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // صورة الكورس العلوية
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              courseImageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // تفاصيل الكورس (النصوص وصورة المحاضر)
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم الكورس
                Text(
                  title,
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),

                // الوصف المختصر
                Text(
                  description,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 16),

                // بيانات المحاضر
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(instructorImageUrl),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'By $instructorName',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
