import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';

/// Alert Card widget
/// Individual alert card with location, time, radius info and action buttons
class AlertCardWidget extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final String radius;
  final bool isActive;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  /// Alert Card constructor
  const AlertCardWidget({
    super.key,
    required this.title,
    required this.location,
    required this.time,
    required this.radius,
    required this.isActive,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.spacing20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          children: [
            // Header with title and status
            _buildHeader(),

            SizedBox(height: AppConstants.spacing20),

            // Alert details
            _buildAlertDetails(),

            SizedBox(height: AppConstants.spacing20),

            // Action buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  /// Builds the header with title and active status
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title
        Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Active status chip
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFF8EDB2D).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: const Color(0xFF8EDB2D), width: 1),
          ),
          child: Text(
            'Active',
            style: AppTextStyles.bodySmall.copyWith(
              color: const Color(0xFF61991A),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the alert details section
  Widget _buildAlertDetails() {
    return Column(
      children: [
        // Location row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: _buildDetailItem(
                icon: IconPath.location,
                text: 'Location: $location',
              ),
            ),
            // Spacer(),
            Expanded(
              child: _buildDetailItem(
                icon: IconPath.radius,
                text: 'Radius: $radius',
                iconColor: AppColors.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        // Time row
        _buildDetailItem(icon: IconPath.clock, text: 'Time: $time'),
      ],
    );
  }

  /// Builds individual detail item with icon and text
  Widget _buildDetailItem({
    required String icon,
    required String text,
    Color? iconColor,
  }) {
    return Row(
      children: [
        // Icon background
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
          child: Transform.scale(
            scale: 0.6,
            child: Image.asset(icon, height: 14.h, width: 14.w),
          ),
        ),

        SizedBox(width: 8.w),

        // Text
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    );
  }

  /// Builds the action buttons section
  Widget _buildActionButtons() {
    return Row(
      children: [
        // Delete button
        Expanded(
          child: SizedBox(
            height: 45.h,
            child: FilledButton(
              onPressed: onDelete,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.error.withValues(alpha: 0.09),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadiusLarge,
                  ),
                ),
                elevation: 0,
              ),
              child: Text(
                'Delete',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.error,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 14.w),

        // Edit Details button
        Expanded(
          child: SizedBox(
            height: 45.h,
            child: FilledButton(
              onPressed: onEdit,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadiusLarge,
                  ),
                ),
                elevation: 0,
              ),
              child: Text(
                'Edit Details',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
