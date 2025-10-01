import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/mark_spot/controllers/mark_spot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Notes Field Widget
/// Multi-line text field for additional notes
class NotesFieldWidget extends StatelessWidget {
  /// Notes Field Widget constructor
  const NotesFieldWidget({super.key, required this.controller});

  final MarkSpotController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: const Color(0xFFCBD3FF).withValues(alpha: 0.6),
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: controller.notesController,
        maxLines: null,
        expands: true,
        style: AppTextStyles.bodyLarge.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Add any notes here',
          hintStyle: AppTextStyles.bodyLarge.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF000000).withValues(alpha: 0.6),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 21.w,
            vertical: 25.h,
          ),
        ),
        textAlignVertical: TextAlignVertical.top,
        onChanged: (value) => controller.updateNotes(value),
      ),
    );
  }
}
