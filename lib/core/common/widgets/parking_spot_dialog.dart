import 'dart:ui';

import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParkingSpotDialog extends StatelessWidget {
  final VoidCallback? onYesPressed;
  final VoidCallback? onNotNowPressed;

  const ParkingSpotDialog({super.key, this.onYesPressed, this.onNotNowPressed});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Where are you headed?',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              Text(
                'Need a parking spot now?',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              32.verticalSpace,

              CommonButton(
                text: 'Yes, Find Spot',
                margin: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
              ),

              16.verticalSpace,
              CommonButton(
                text: 'Not Now',
                textColor: AppColors.primary,
                backgroundColor: Colors.transparent,
                margin: EdgeInsets.zero,
                onPressed: () {},
                borderSide: BorderSide(color: AppColors.primaryBorder),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
