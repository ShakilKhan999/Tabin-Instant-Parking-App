import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';

/// Custom switch widget that matches Figma design
/// A purple toggle switch with smooth animation
class CustomSwitchWidget extends StatelessWidget {
  /// Custom switch widget constructor
  /// [value] - Current switch state
  /// [onChanged] - Callback when switch is toggled
  const CustomSwitchWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 34.w,
        height: 18.h,
        decoration: BoxDecoration(
          color: value ? AppColors.primary : Colors.grey[300],
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 15.3.w,
            height: 15.3.h,
            margin: EdgeInsets.all(1.7.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 3.4,
                  offset: const Offset(0, 1.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
