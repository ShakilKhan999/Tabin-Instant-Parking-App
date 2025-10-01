import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContributionStatsWidget extends StatelessWidget {
  const ContributionStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // First row - Total Reports and Active Spots
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total Reports',
                  value: '05',
                  icon: IconPath.totalReports,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatCard(
                  title: 'Active Spots',
                  value: '05',
                  icon: IconPath.totalReports,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Second row - Tips Earned and Points Earned
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Tips Earned',
                  value: '\$20',
                  icon: IconPath.tipsEarned,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatCard(
                  title: 'Points Earned',
                  value: '320',
                  icon: IconPath.pointsEarned,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build individual stat card
  Widget _buildStatCard({
    required String title,
    required String value,
    required String icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          // Icon with circular background
          Container(
            width: 37.w,
            height: 37.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Transform.scale(
              scale: 0.6.r,
              child: Image.asset(icon, width: 20.sp, height: 20.sp),
            ),
          ),
          SizedBox(height: 7.h),
          // Title and value
          Column(
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              Text(
                value,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
