import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color titleColor;
  final bool isShowBack;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor = AppColors.background,
    this.titleColor = Colors.black87,
    this.isShowBack = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leadingWidth: isShowBack ? 60.w : 0,
      leading: isShowBack
          ? Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.sp,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
