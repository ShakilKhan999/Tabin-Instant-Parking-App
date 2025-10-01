import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/alerts/views/screens/smart_alerts_screen.dart';
import 'package:ahmedkamal443/features/help_support/views/screens/help_support_screen.dart';
import 'package:ahmedkamal443/features/profile/views/screens/my_reports_screen.dart';
import 'package:ahmedkamal443/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'invite_friends_bottom_sheet.dart';

/// Quick links widget displaying navigation options
/// Shows list of profile menu items as per Figma design
class QuickLinksWidget extends StatelessWidget {
  /// Quick links widget constructor
  const QuickLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Menu items
        _buildMenuItem(
          icon: IconPath.myReport,
          title: 'My Reports',
          onTap: () {
            // Navigate to my reports
            Get.to(() => const MyReportsScreen());
          },
        ),

        SizedBox(height: AppConstants.spacing15),

        _buildMenuItem(
          icon: IconPath.inviteFriend,
          title: 'Invite Friends',
          onTap: () {
            // Navigate to invite friends
            InviteFriendsBottomSheet.show(context);
          },
        ),

        SizedBox(height: AppConstants.spacing15),

        _buildMenuItem(
          icon: IconPath.smartAlerts,
          title: 'Smart Alerts',
          onTap: () {
            // Navigate to smart alerts
            Get.to(() => const SmartAlertsScreen());
          },
        ),

        SizedBox(height: AppConstants.spacing15),

        _buildMenuItem(
          icon: IconPath.settings,
          title: 'Setting',
          onTap: () {
            // Navigate to settings
            Get.toNamed(AppRoutes.settings);
          },
        ),

        SizedBox(height: AppConstants.spacing15),

        _buildMenuItem(
          icon: IconPath.helpSupport,
          title: 'Help & Support',
          onTap: () {
            // Navigate to help & support
            Get.to(() => const HelpSupportScreen());
          },
        ),

        SizedBox(height: AppConstants.spacing32),

        // Logout button
        _buildLogoutButton(),
      ],
    );
  }

  /// Builds individual menu item
  Widget _buildMenuItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Transform.scale(
                scale: 0.5,
                child: Image.asset(icon, height: 20.h, width: 20.h),
              ),
            ),

            SizedBox(width: AppConstants.spacing16),

            // Title
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.labelMedium.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Arrow icon
            Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds logout button
  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {
        // Handle logout
      },
      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.paddingLarge,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFF383C).withValues(alpha: 0.13),
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgPath.logout, height: 24.w, width: 24.w),

            SizedBox(width: AppConstants.spacing8),

            Text(
              'Logout',
              style: AppTextStyles.labelLarge.copyWith(
                fontSize: 16.sp,
                color: const Color(0xFFFF383C), // Red color from Figma
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
