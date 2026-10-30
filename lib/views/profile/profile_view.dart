import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/views/profile/widgets%20copy/app_bar_profile.dart';
import 'package:elearning/views/profile/widgets%20copy/custom_divider.dart';
import 'package:elearning/views/profile/widgets%20copy/custom_header.dart';
import 'package:elearning/views/profile/widgets%20copy/custom_list_tile.dart';
import 'package:flutter/material.dart';

class PatientModel {
  final String name = "kareem";
  final String email = "[EMAIL_ADDRESS]";
  final String phone = "01091325633";
  final String age = "21";
  final String bloodType = "A+";
  final String photoURL = "assets/images/profile.jpg";
}

class ProfilePatientScreen extends StatelessWidget {
  final PatientModel user;
  final VoidCallback? onLogout;
  final VoidCallback? onDeleteAccount;

  const ProfilePatientScreen({
    super.key,
    required this.user,
    this.onLogout,
    this.onDeleteAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(asset: user.photoURL),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildSectionCard(
                    child: Column(
                      children: [
                        CustomeHedar(
                          title: 'personal_information',
                          iconData: Icons.person_outline,
                        ),
                        const SizedBox(height: 5),
                        CustomeListTile(
                          icon: Icon(
                            Icons.person_outline,
                            color: AppColors.primary,
                          ),
                          title: 'full_name_label',
                          trailingText: user.name,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.email_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'email_address_label',
                          trailingText: user.email,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.phone_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'phone_number_label',
                          trailingText: user.phone,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'date_of_birth',
                          trailingText: user.age.toString(),
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'location',
                          trailingText: 'cairo_egypt',
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.water_drop_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'blood_type',
                          trailingText: user.bloodType,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    child: Column(
                      children: [
                        CustomeHedar(
                          title: 'account_and_security',
                          iconData: Icons.security,
                        ),
                        const SizedBox(height: 5),
                        CustomeListTile(
                          icon: Icon(
                            Icons.lock_outline,
                            color: AppColors.primary,
                          ),
                          title: 'change_password',
                          showArrow: true,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.shield_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'privacy_settings',
                          showArrow: true,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'notification_preferences',
                          showArrow: true,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.phonelink_lock_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'two_factor_authentication',
                          showArrow: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    child: Column(
                      children: [
                        CustomeHedar(
                          title: 'health_information',
                          iconData: Icons.favorite_border,
                        ),
                        const SizedBox(height: 5),
                        CustomeListTile(
                          icon: Icon(
                            Icons.coronavirus_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'allergies',
                          trailingText: 'allergies_value',
                          showArrow: true,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.medical_information_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'medical_conditions',
                          trailingText: 'no_conditions',
                          showArrow: true,
                        ),
                        const CustomDivider(),
                        CustomeListTile(
                          icon: Icon(
                            Icons.medication_outlined,
                            color: AppColors.primary,
                          ),
                          title: 'current_medications',
                          trailingText: 'vitamin_d',
                          showArrow: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onLogout,
                      icon: const Icon(Icons.logout, color: Colors.white),
                      label: Text(
                        'logout',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onDeleteAccount,
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      label: Text(
                        'delete_account',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
