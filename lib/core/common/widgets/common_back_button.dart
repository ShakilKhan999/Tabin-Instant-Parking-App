import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final Widget? trailing;
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData? backIcon;
  final double? topPadding;

  const CommonBackButton({
    super.key,
    this.onBackPressed,
    this.trailing,
    this.backgroundColor,
    this.iconColor,
    this.backIcon,
    this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (topPadding ?? MediaQuery.of(context).padding.top) + 10.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackPressed ?? () => Get.back(),
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                backIcon ?? Icons.arrow_back_ios_new,
                size: 20.sp,
                color: iconColor ?? Colors.black87,
              ),
            ),
          ),
          if (trailing != null) ...[const Spacer(), trailing!],
        ],
      ),
    );
  }
}
