import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'add_alert_bottom_sheet.dart';

/// Add Alert button widget
/// Styled button for adding new parking alerts
class AddAlertButtonWidget extends StatelessWidget {
  /// Add Alert button constructor
  const AddAlertButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFA13FD3), Color(0xFF6A5AE0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _onAddAlertTapped,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingMedium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add icon
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Iconsax.add,
                    color: AppColors.primary,
                    size: 16.sp,
                  ),
                ),

                SizedBox(width: 6.w),

                // Add Alert text
                Text(
                  'Add Alert',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Handles add alert button tap
  void _onAddAlertTapped() {
    // Show add alert bottom sheet
    AddAlertBottomSheet.show(Get.context!);
  }
}
