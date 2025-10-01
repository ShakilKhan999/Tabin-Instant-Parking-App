import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/rewards/models/reward_model.dart';

/// Redemption history item widget
/// Displays a past redemption with image, title, date and points used
class RedemptionItemWidget extends StatelessWidget {
  /// Redemption item widget constructor
  /// [redemption] - The redemption to display
  const RedemptionItemWidget({super.key, required this.redemption});

  final RedemptionModel redemption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        // border: Border.all(
        //   color: AppColors.primary.withValues(alpha: 0.2),
        //   width: 1,
        // ),
      ),
      child: Row(
        children: [
          // Redemption image and info
          Expanded(
            child: Row(
              children: [
                // Redemption image
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(redemption.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                // Redemption details
                Expanded(
                  child: Text(
                    '${redemption.rewardTitle} — ${redemption.timeAgo} — ${redemption.pointsUsed} Points',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
