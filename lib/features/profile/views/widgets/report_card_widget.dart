import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:ahmedkamal443/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ReportCardWidget extends StatelessWidget {
  final String spotName;
  final String address;
  final String status;
  final Color statusColor;
  final String reportedTime;
  final String tipsEarned;
  final int likes;
  final int dislikes;
  final bool showActionButtons;
  final bool showDeleteOnly;
  final bool showReReport;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onReReport;

  const ReportCardWidget({
    super.key,
    required this.spotName,
    required this.address,
    required this.status,
    required this.statusColor,
    required this.reportedTime,
    required this.tipsEarned,
    required this.likes,
    required this.dislikes,
    this.showActionButtons = false,
    this.showDeleteOnly = false,
    this.showReReport = false,
    this.onDelete,
    this.onEdit,
    this.onReReport,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Parking spot image
                Container(
                  width: 97.w,
                  height: 145.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage(ImagePath.parkingSpace),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                // Content section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and status
                      Row(
                        children: [
                          Text(
                            spotName,
                            style: AppTextStyles.titleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          const Spacer(),
                          _buildStatusChip(),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      // Address
                      Text(
                        address,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // Reported time
                      Text(
                        'Reported: $reportedTime',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Tips earned container
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x1A844DDA),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Iconsax.star_1,
                              color: AppColors.primary,
                              size: 16.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Tips Earned: $tipsEarned',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Likes and dislikes
                      Row(
                        children: [
                          _buildLikeDislikeChip(
                            icon: IconPath.like,
                            count: likes,
                            isLike: true,
                          ),
                          SizedBox(width: 15.w),
                          _buildLikeDislikeChip(
                            icon: IconPath.dislike,
                            count: dislikes,
                            isLike: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action buttons section
          if (showActionButtons || showDeleteOnly || showReReport)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: _buildActionButtons(),
            ),
        ],
      ),
    );
  }

  /// Build status chip based on status type
  Widget _buildStatusChip() {
    Color backgroundColor;
    Color textColor;
    String statusText = status;

    switch (status.toLowerCase()) {
      case 'available':
        backgroundColor = AppColors.success.withValues(alpha: 0.2);
        textColor = const Color(0xFF61991A);
        statusText = '🅿️ Available';
        break;
      case 'expired':
        backgroundColor = const Color(0xFFDCDCDC);
        textColor = AppColors.textPrimary;
        break;
      case 'reported taken':
        backgroundColor = AppColors.error.withValues(alpha: 0.09);
        textColor = AppColors.error;
        break;
      default:
        backgroundColor = AppColors.textSecondary.withValues(alpha: 0.1);
        textColor = AppColors.textSecondary;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
        border: status.toLowerCase() == 'available'
            ? Border.all(color: const Color(0xFF8EDB2D))
            : null,
      ),
      child: Text(
        statusText,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
          height: 1.75,
        ),
      ),
    );
  }

  /// Build like/dislike chip
  Widget _buildLikeDislikeChip({
    required String icon,
    required int count,
    required bool isLike,
  }) {
    Color backgroundColor = isLike
        ? const Color(0xFF2189F0).withValues(alpha: 0.2)
        : AppColors.error.withValues(alpha: 0.09);
    Color iconColor = isLike ? const Color(0xFF2189F0) : AppColors.error;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon, width: 16.sp, height: 16.sp),
          SizedBox(width: 4.w),
          Text(
            '$count ${isLike ? "Likes" : "Dislikes"}',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Build action buttons section
  Widget _buildActionButtons() {
    if (showReReport) {
      return _buildSingleButton(
        text: 'Re Report',
        onPressed: onReReport,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
      );
    }

    if (showDeleteOnly) {
      return _buildSingleButton(
        text: 'Delete',
        onPressed: onDelete,
        backgroundColor: AppColors.error.withValues(alpha: 0.09),
        textColor: AppColors.error,
      );
    }

    if (showActionButtons) {
      return Row(
        children: [
          // Delete button
          Expanded(
            flex: 1,
            child: _buildActionButton(
              text: 'Delete',
              onPressed: onDelete,
              backgroundColor: AppColors.error.withValues(alpha: 0.09),
              textColor: AppColors.error,
            ),
          ),
          SizedBox(width: 16.w),
          // Edit Details button
          Expanded(
            flex: 2,
            child: _buildActionButton(
              text: 'Edit Details',
              onPressed: onEdit,
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  /// Build single action button
  Widget _buildSingleButton({
    required String text,
    required VoidCallback? onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: FilledButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: AppTextStyles.labelLarge.copyWith(
            color: textColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  /// Build individual action button
  Widget _buildActionButton({
    required String text,
    required VoidCallback? onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return SizedBox(
      height: 45.h,
      child: FilledButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: AppTextStyles.labelMedium.copyWith(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
