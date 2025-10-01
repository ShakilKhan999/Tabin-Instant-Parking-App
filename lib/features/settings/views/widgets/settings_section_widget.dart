import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';

/// Settings section widget
/// Groups related settings under a section title
class SettingsSectionWidget extends StatelessWidget {
  /// Settings section widget constructor
  /// [title] - Section title
  /// [children] - List of settings items in this section
  const SettingsSectionWidget({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          title,
          style: AppTextStyles.headlineMedium.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: 14.h),

        // Settings items
        Column(
          children: children
              .expand(
                (child) => [
                  child,
                  if (child != children.last) SizedBox(height: 14.h),
                ],
              )
              .toList(),
        ),
      ],
    );
  }
}
