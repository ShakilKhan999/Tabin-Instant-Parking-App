import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reward Info Widget
/// Displays reward information cards
class RewardInfoWidget extends StatelessWidget {
  /// Reward Info Widget constructor
  const RewardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Points reward card
        _buildRewardCard(
          backgroundColor: AppColors.yellow,
          iconColor: AppColors.textPrimary,
          textColor: AppColors.textPrimary,
          icon: IconPath.pointsEarned,
          text: "You'll earn +10 Points",
        ),

        SizedBox(height: 10.h),

        // Tips reward card
        _buildRewardCard(
          backgroundColor: const Color(0xFF292107),
          iconColor: AppColors.white,
          textColor: AppColors.white,
          icon: IconPath.reciveTips,
          text: "You may also receive tips",
        ),
      ],
    );
  }

  /// Builds individual reward card
  Widget _buildRewardCard({
    required Color backgroundColor,
    required Color iconColor,
    required Color textColor,
    required String icon,
    required String text,
  }) {
    return Container(
      height: 57.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon container
            Center(
              child: Image.asset(
                icon,
                color: iconColor,
                width: 40.w,
                height: 40.h,
              ),
            ),

            SizedBox(width: 11.w),

            // Text
            Text(
              text,
              style: AppTextStyles.titleMedium.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: textColor,
                letterSpacing: 0.1909,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
