import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/alerts/controllers/alerts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/alerts/views/widgets/add_alert_button_widget.dart';
import 'package:ahmedkamal443/features/alerts/views/widgets/alert_card_widget.dart';

/// Smart Alerts screen widget
/// Displays user's smart parking alerts with add/edit/delete functionality
class SmartAlertsScreen extends StatelessWidget {
  /// Smart Alerts screen constructor
  const SmartAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final AlertsController controller = Get.put(AlertsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppConstants.spacing20),

            // Header with back button and title
            _buildHeader(),

            SizedBox(height: AppConstants.spacing24),

            // Add Alert button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
              ),
              child: const AddAlertButtonWidget(),
            ),

            SizedBox(height: AppConstants.spacing24),

            // Alerts list
            Expanded(child: Obx(() => _buildAlertsList(controller))),
          ],
        ),
      ),
    );
  }

  /// Builds the header with back button and title
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingLarge),
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
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusCircular,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.border.withValues(alpha: 0.38),
                    blurRadius: 19.3,
                    offset: const Offset(5.921, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
                size: 16.w,
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                'Smart Alerts',
                style: AppTextStyles.titleLarge.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Empty space to balance the back button
          SizedBox(width: 50.w),
        ],
      ),
    );
  }

  /// Builds the alerts list with timeline
  Widget _buildAlertsList(AlertsController controller) {
    if (controller.alerts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.notification,
              size: 64.sp,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: AppConstants.spacing16),
            Text(
              'No alerts yet',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: AppConstants.spacing8),
            Text(
              'Create your first alert to get notified\nabout parking spots',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingLarge),
      itemCount: controller.alerts.length,
      itemBuilder: (context, index) {
        final alert = controller.alerts[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            // _buildTimelineIndicator(index, controller.alerts.length),
            // SizedBox(width: AppConstants.spacing24),

            // Alert card
            Expanded(
              child: AlertCardWidget(
                title: alert.title,
                location: alert.location,
                time: alert.time,
                radius: alert.radius,
                isActive: alert.isActive,
                onDelete: () {
                  // Handle delete action
                  _showDeleteConfirmation(context, alert.id, controller);
                },
                onEdit: () {
                  // Handle edit action
                  _navigateToEditAlert(alert.id);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // /// Builds timeline indicator for each alert
  // Widget _buildTimelineIndicator(int index, int totalItems) {
  //   return Column(
  //     children: [
  //       // Timeline dot
  //       Container(
  //         width: 17.w,
  //         height: 17.h,
  //         decoration: BoxDecoration(
  //           color: AppColors.primary,
  //           shape: BoxShape.circle,
  //         ),
  //       ),

  //       // Timeline line (show for all except last item)
  //       if (index < totalItems - 1)
  //         Container(
  //           width: 2.w,
  //           height: 200.h, // Adjust based on card height
  //           color: AppColors.primary.withValues(alpha: 0.3),
  //           margin: EdgeInsets.symmetric(vertical: 4.h),
  //         ),
  //     ],
  //   );
  // }

  /// Shows delete confirmation dialog
  void _showDeleteConfirmation(
    BuildContext context,
    String alertId,
    AlertsController controller,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          ),
          title: Text('Delete Alert', style: AppTextStyles.titleMedium),
          content: Text(
            'Are you sure you want to delete this alert?',
            style: AppTextStyles.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle actual delete logic here
                controller.deleteAlert(alertId);
              },
              style: FilledButton.styleFrom(backgroundColor: AppColors.error),
              child: Text(
                'Delete',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Navigates to edit alert screen
  void _navigateToEditAlert(String alertId) {
    // TODO: Navigate to edit alert screen
    Get.snackbar(
      'Edit Alert',
      'Navigate to edit alert screen for ID: $alertId',
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
    );
  }
}
