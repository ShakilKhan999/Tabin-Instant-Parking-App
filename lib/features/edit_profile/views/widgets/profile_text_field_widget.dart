import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';

/// Custom text field widget for edit profile form
/// Text field with icon and consistent styling
class ProfileTextFieldWidget extends StatelessWidget {
  /// Profile text field widget constructor
  /// [controller] - Text editing controller
  /// [iconPath] - Path to icon asset
  /// [hintText] - Placeholder text
  /// [isPassword] - Whether this is a password field
  /// [isPasswordVisible] - Whether password is visible (for password fields)
  /// [onPasswordToggle] - Callback for password visibility toggle
  /// [isError] - Whether field has validation error
  /// [onChanged] - Callback when text changes
  /// [readOnly] - Whether field is read-only
  /// [suffixIcon] - Optional suffix icon widget
  const ProfileTextFieldWidget({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.hintText,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onPasswordToggle,
    this.isError = false,
    this.onChanged,
    this.readOnly = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String iconPath;
  final String hintText;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onPasswordToggle;
  final bool isError;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(13.674.r),
        border: Border.all(
          color: isError ? AppColors.error : const Color(0xFF7B7DFF),
          width: 1.14,
        ),
      ),
      child: Row(
        children: [
          // Icon
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 15.w),
            child: SvgPicture.asset(
              iconPath,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                isError ? AppColors.error : const Color(0xFF7B7DFF),
                BlendMode.srcIn,
              ),
            ),
          ),

          // Text field
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: isPassword && !isPasswordVisible,
              readOnly: readOnly,
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: 16.sp,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 16.sp,
                  color: const Color(0xFF9092A3),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 22.364.h),
              ),
              onChanged: onChanged,
            ),
          ),

          // Suffix icon (password toggle or custom)
          if (isPassword || suffixIcon != null)
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: isPassword
                  ? GestureDetector(
                      onTap: onPasswordToggle,
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF9092A3),
                        size: 20.w,
                      ),
                    )
                  : suffixIcon,
            ),
        ],
      ),
    );
  }
}
