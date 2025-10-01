import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  const CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.style,
    this.hintStyle,
    this.borderColor,
    this.borderRadius,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? AppColors.borderColor;
    final effectiveBorderRadius = borderRadius ?? 15.r;
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style:
            style ??
            getTextStyle(
              fontSize: 16.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w400,
            ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle:
              hintStyle ??
              getTextStyle(fontSize: 16.sp, color: AppColors.hinttext),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            borderSide: BorderSide(color: effectiveBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            borderSide: BorderSide(color: effectiveBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            borderSide: BorderSide(color: effectiveBorderColor, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            borderSide: BorderSide(color: Colors.red),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
