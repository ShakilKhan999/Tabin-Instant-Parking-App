import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/image_path.dart';

/// Rewards header widget
/// Displays user points, progress to next level, and trophy illustration
class RewardsHeaderWidget extends StatelessWidget {
  /// Rewards header widget constructor
  /// [userPoints] - Current user points
  /// [pointsToGold] - Points needed to reach gold level
  /// [progressToGold] - Progress percentage to gold level (0.0 to 1.0)
  const RewardsHeaderWidget({
    super.key,
    required this.userPoints,
    required this.pointsToGold,
    required this.progressToGold,
  });

  final int userPoints;
  final int pointsToGold;
  final double progressToGold;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.rewardHeader),
          fit: BoxFit.cover,
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(34.r),
          bottomRight: Radius.circular(34.r),
        ),
      ),
      child: Stack(
        children: [
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Crown icon and points info
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 72.h),
                    // Crown icon
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Center(
                        child: Image.asset(
                          ImagePath.crownIcon,
                          width: 24.w,
                          height: 24.h,
                          color: const Color(0xFF6E5812),
                        ),
                      ),
                    ),

                    SizedBox(height: 9.h),

                    // Points information
                    Text(
                      'Available Points',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      userPoints.toString(),
                      style: AppTextStyles.displayLarge.copyWith(
                        fontSize: 56.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      '$pointsToGold points to reach Gold',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // Progress bar
              Container(
                width: 149.w,
                height: 11.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: (149.w * progressToGold).clamp(0.0, 149.w),
                      height: 11.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD54B),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
