import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/rewards/models/reward_model.dart';

/// Reward item widget
/// Displays a reward with image, title, points and redeem button
class RewardItemWidget extends StatelessWidget {
  /// Reward item widget constructor
  /// [reward] - The reward to display
  /// [canRedeem] - Whether user can redeem this reward
  /// [onRedeem] - Callback when redeem button is tapped
  const RewardItemWidget({
    super.key,
    required this.reward,
    required this.canRedeem,
    required this.onRedeem,
  });

  final RewardModel reward;
  final bool canRedeem;
  final VoidCallback onRedeem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Reward image and info
          Expanded(
            child: Row(
              children: [
                // Reward image
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(reward.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                // Reward title and points
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${reward.title} — ${reward.pointsRequired} Points',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // Redeem button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: canRedeem ? AppColors.primary : AppColors.textSecondary,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: GestureDetector(
              onTap: canRedeem ? onRedeem : null,
              child: Text(
                'Redeem',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
