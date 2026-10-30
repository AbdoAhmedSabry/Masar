import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key, this.asset});
  final String? asset;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.primary),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Profile',
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Manage account preferences',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.surface,
                    radius: 52,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage(asset ?? ""),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.surface,
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
