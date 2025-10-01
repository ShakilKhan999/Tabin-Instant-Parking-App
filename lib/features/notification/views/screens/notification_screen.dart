import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/notification/controllers/notification_controller.dart';
import 'package:ahmedkamal443/features/notification/views/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Notifications screen displaying all user notifications
/// Matches the Figma design with proper layout and styling
class NotificationScreen extends StatelessWidget {
  /// Notifications screen for displaying all user notifications
  /// Implements the design from Figma with proper header and list

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Status bar height
            SizedBox(height: 24.h),
            // Custom app bar
            _buildAppBar(),
            SizedBox(height: 24.h),
            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recent section header
                    _buildSectionHeader(),
                    SizedBox(height: 18.h),
                    // Notifications list
                    Expanded(child: _buildNotificationsList(controller)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the custom app bar with back button and title
  Widget _buildAppBar() {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 17.5.w),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(45.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textPrimary,
                  size: 18.sp,
                ),
              ),
            ),
          ),
          // Spacer to center the title
          Expanded(
            child: Center(
              child: Text(
                'Notifications',
                style: AppTextStyles.titleLarge.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the "Recent" section header
  Widget _buildSectionHeader() {
    return Text(
      'Recent',
      style: AppTextStyles.titleLarge.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Builds the notifications list with loading and error states
  Widget _buildNotificationsList(NotificationController controller) {
    return Obx(() {
      if (controller.isLoading.value) {
        return _buildLoadingState();
      }

      if (controller.recentNotifications.isEmpty) {
        return _buildEmptyState();
      }

      return RefreshIndicator(
        onRefresh: controller.refreshNotifications,
        color: AppColors.primary,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: controller.recentNotifications.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final notification = controller.recentNotifications[index];
            return NotificationItemWidget(
              notification: notification,
              onTap: () => controller.onNotificationTapped(notification),
            );
          },
        ),
      );
    });
  }

  /// Builds the loading state with shimmer effect
  Widget _buildLoadingState() {
    return Column(
      children: List.generate(
        5,
        (index) => Container(
          width: double.infinity,
          height: 80.h,
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2.w,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the empty state when no notifications
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 64.sp,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16.h),
          Text(
            'No Notifications',
            style: AppTextStyles.titleLarge.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'You don\'t have any notifications yet.',
            style: AppTextStyles.labelMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
