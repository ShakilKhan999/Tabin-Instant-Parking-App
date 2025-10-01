import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/notification/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Notification item widget for displaying individual notifications
/// Matches the design from Figma with proper spacing and colors
class NotificationItemWidget extends StatelessWidget {
  /// Individual notification item widget
  /// Displays notification data with proper styling as per Figma design

  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80.h,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: notification.isHighlighted
              ? AppColors.primary
              : AppColors.surface,
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
            // Notification icon
            _buildNotificationIcon(),
            SizedBox(width: 14.w),
            // Content
            Expanded(child: _buildNotificationContent()),
            SizedBox(width: 14.w),
            // Time
            _buildTimeText(),
          ],
        ),
      ),
    );
  }

  /// Builds the notification icon based on notification type
  Widget _buildNotificationIcon() {
    return Container(
      width: 37.w,
      height: 37.h,
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(_getIconData(), color: _getIconColor(), size: 20.sp),
      ),
    );
  }

  /// Builds the notification content (title and subtitle)
  Widget _buildNotificationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Text(
          notification.title,
          style: AppTextStyles.titleMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: notification.isHighlighted
                ? AppColors.white
                : AppColors.textPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        // Subtitle
        Text(
          notification.subtitle,
          style: AppTextStyles.labelMedium.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: notification.isHighlighted
                ? AppColors.white.withValues(alpha: 0.8)
                : AppColors.textSecondary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  /// Builds the time text
  Widget _buildTimeText() {
    return Text(
      notification.time,
      style: AppTextStyles.labelMedium.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: notification.isHighlighted
            ? AppColors.white.withValues(alpha: 0.9)
            : AppColors.primary,
      ),
    );
  }

  /// Gets icon data based on notification type
  IconData _getIconData() {
    switch (notification.type) {
      case NotificationType.parkingSpot:
        return Icons.local_parking;
      case NotificationType.points:
        return Icons.star;
      case NotificationType.tip:
        return Icons.monetization_on;
      case NotificationType.expired:
        return Icons.warning;
      case NotificationType.general:
        return Icons.notifications;
    }
  }

  /// Gets icon color based on notification type and highlight status
  Color _getIconColor() {
    if (notification.isHighlighted) {
      return AppColors.white;
    }

    switch (notification.type) {
      case NotificationType.parkingSpot:
        return AppColors.primary;
      case NotificationType.points:
        return AppColors.warning;
      case NotificationType.tip:
        return AppColors.white;
      case NotificationType.expired:
        return AppColors.white;
      case NotificationType.general:
        return AppColors.primary;
    }
  }

  /// Gets icon background color based on notification type
  Color _getIconBackgroundColor() {
    if (notification.isHighlighted) {
      return AppColors.white.withValues(alpha: 0.2);
    }

    switch (notification.type) {
      case NotificationType.parkingSpot:
        return AppColors.primary.withValues(alpha: 0.1);
      case NotificationType.points:
        return AppColors.warning.withValues(alpha: 0.1);
      case NotificationType.tip:
        return AppColors.primary;
      case NotificationType.expired:
        return AppColors.error;
      case NotificationType.general:
        return AppColors.primary.withValues(alpha: 0.1);
    }
  }
}
