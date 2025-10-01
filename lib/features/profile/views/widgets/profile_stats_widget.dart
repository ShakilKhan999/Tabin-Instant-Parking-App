import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';

/// Profile stats widget displaying Gift, Points, and Badge Level
/// Shows user statistics in a purple gradient card as per Figma design
class ProfileStatsWidget extends StatelessWidget {
  /// Profile stats widget constructor
  const ProfileStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge + 9.w,
        vertical: 17.h,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF864FDD), Color(0xFF7F6BF9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Gift stat
          _buildStatItem(
            icon: IconPath.gift,
            iconColor: const Color(0xFF9FEC3D), // Green from Figma
            label: 'Gift',
            value: '05',
            labelColor: const Color(0xFF9FEC3D),
          ),

          // Divider
          _buildDivider(),

          // Points stat
          _buildStatItem(
            icon: IconPath.points,
            iconColor: const Color(0xFFF6D116), // Yellow from Figma
            label: 'Points',
            value: '1200',
            labelColor: const Color(0xFFF6D116),
          ),

          // Divider
          _buildDivider(),

          // Badge Level stat
          _buildStatItem(
            icon: IconPath.badgeLevel,
            iconColor: AppColors.white,
            label: 'Badge Level',
            value: 'Silver',
            labelColor: AppColors.white,
          ),
        ],
      ),
    );
  }

  /// Builds individual stat item
  Widget _buildStatItem({
    required String icon,
    required Color iconColor,
    required String label,
    required String value,
    required Color labelColor,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon
        Image.asset(icon, width: 30.w, height: 30.h),

        SizedBox(height: AppConstants.spacing8),

        // Label
        Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            fontSize: 14.sp,
            color: labelColor,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: AppConstants.spacing2),

        // Value
        Text(
          value,
          style: AppTextStyles.labelLarge.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// Builds vertical divider between stats
  Widget _buildDivider() {
    return Container(height: 83.h, width: 1.w, color: AppColors.primary);
  }
}
