import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'custom_switch_widget.dart';

/// Settings item widget
/// Individual setting item with icon, title, and action
class SettingsItemWidget extends StatelessWidget {
  /// Settings item widget constructor
  /// [icon] - Icon widget to display
  /// [title] - Title text for the setting
  /// [hasSwitch] - Whether to show toggle switch or arrow
  /// [switchValue] - Current switch value (if hasSwitch is true)
  /// [onTap] - Callback when item is tapped
  /// [onSwitchToggle] - Callback when switch is toggled (if hasSwitch is true)
  const SettingsItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onTap,
    this.onSwitchToggle,
  });

  final Widget icon;
  final String title;
  final bool hasSwitch;
  final bool switchValue;
  final VoidCallback? onTap;
  final VoidCallback? onSwitchToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasSwitch ? null : onTap,
      child: Container(
        width: double.infinity,
        // height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Row(
            children: [
              // Icon with background circle
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E6FA), // Light purple background
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(child: icon),
              ),

              SizedBox(width: 24.w),

              // Title
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              // Action (switch or arrow)
              if (hasSwitch)
                CustomSwitchWidget(
                  value: switchValue,
                  onChanged: onSwitchToggle ?? () {},
                )
              else
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.w,
                  color: AppColors.textPrimary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
