import 'dart:ui';

import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/map/controllers/spot_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FakeSpotReportDialog extends StatelessWidget {
  const FakeSpotReportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),

      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icons/warning.png',
                    ), // or NetworkImage('url')
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              16.verticalSpace,

              Text(
                'Are you sure you want to report \nthis spot as fake/taken?',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text161616,
                ),
              ),

              17.verticalSpace,

              CommonButton(
                text: 'Yes, Report',
                fontWeight: FontWeight.w500,
                onPressed: () {
                  Get.back();
                },
              ),

              CommonButton(
                text: 'Cancel',
                fontWeight: FontWeight.w500,
                onPressed: () {
                  Get.back();
                },
                textColor: AppColors.primary,
                backgroundColor: Colors.transparent,
                borderSide: BorderSide(color: AppColors.textFiledColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
