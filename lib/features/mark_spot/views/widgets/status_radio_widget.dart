import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Status Radio Widget
/// Custom radio button widget for status selection
class StatusRadioWidget extends StatelessWidget {
  /// Status Radio Widget constructor
  const StatusRadioWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // Radio button
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFF23139E) : AppColors.white,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFDAD5FF)
                    : const Color(0xFFD2D5DA),
                width: isSelected ? 3.0 : 2.0,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Title
          Text(
            title,
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
