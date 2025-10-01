import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/mark_spot/controllers/mark_spot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Location Field Widget
/// Widget for displaying and editing GPS location
class LocationFieldWidget extends StatelessWidget {
  /// Location Field Widget constructor
  const LocationFieldWidget({super.key, required this.controller});

  final MarkSpotController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: const Color(0xFFCBD3FF).withValues(alpha: 0.5),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.gpsLocation.value,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000).withValues(alpha: 0.6),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => controller.showLocationPicker(),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textPrimary,
                size: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
