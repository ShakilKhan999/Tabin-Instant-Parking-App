import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final bool isEnabled;
  final Widget? icon;
  final MainAxisAlignment? mainAxisAlignment;
  final BorderSide? borderSide;
  final Gradient? gradient;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
    this.isEnabled = true,
    this.icon,
    this.mainAxisAlignment,
    this.borderSide,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 55.h,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15.w),
        margin:
            margin ?? EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x1C31286E),
              blurRadius: 24.44,
              offset: Offset(0, 8.89),
              spreadRadius: 0,
            ),
          ],
          gradient: isEnabled && gradient != null ? gradient : null,
          color: gradient == null
              ? (isEnabled
                    ? (backgroundColor ?? AppColors.primary)
                    : Colors.grey)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, 8.horizontalSpace],
            Text(
              text.tr,
              textAlign: TextAlign.center,
              style: getTextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? 14.sp,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
