import 'dart:ui';

import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/map/models/gift_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GiftSentDialog extends StatelessWidget {
  final Gift gift;

  const GiftSentDialog({super.key, required this.gift});

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
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icons/suceess.png',
                    ), // or NetworkImage('url')
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              16.verticalSpace,

              Text(
                'Gift sent',
                style: getTextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text161616,
                ),
              ),

              8.verticalSpace,

              Text(
                'Thanks for supporting the community.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: getTextStyle(
                  fontSize: 16.sp,
                  color: AppColors.text151515,
                ),
              ),

              24.verticalSpace,

              CommonButton(
                text: 'Done',
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                margin: EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
