import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_back_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:ahmedkamal443/features/home/controller/route_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RouteDetailsScreen extends StatelessWidget {
  const RouteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteDetailsController controller = Get.put(RouteDetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildMapSection(controller),
          _buildTopBar(context, controller),
          _buildBottomInfoCard(controller),
        ],
      ),
    );
  }

  Widget _buildMapSection(RouteDetailsController controller) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200],
      child: Obx(
        () => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                image: const DecorationImage(
                  opacity: 0.8,

                  image: AssetImage('assets/images/maps.png'),

                  fit: BoxFit.cover,
                ),
              ),

              child: Center(
                child: Text(
                  'Map View\n${controller.routeTitle.value}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, RouteDetailsController controller) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        children: [
          CommonBackButton(
            onBackPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInfoCard(RouteDetailsController controller) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20.w,
            24.h,
            20.w,
            MediaQuery.of(Get.context!).padding.bottom + 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 88.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.bottomSheetDividerColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              10.verticalSpace,
              Obx(
                () => Text(
                  controller.routeTitle.value,
                  style: getTextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              25.verticalSpace,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildInfoContainer(
                        iconPath: 'assets/icons/location.png',
                        value: controller.distance.value,
                        color: Color(0xff1E1756),
                        backgroundColor: Colors.red,
                      ),
                    ),
                    15.horizontalSpace,
                    Expanded(
                      child: _buildInfoContainer(
                        iconPath: 'assets/icons/routing.png',
                        value: controller.estimatedTime.value,
                        color: Color(0xff1E1756),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              CommonButton(
                text: 'Start Navigate',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer({
    required String iconPath,
    required String value,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: ShapeDecoration(
        color: const Color(0x147E6DFB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            padding: EdgeInsets.all(4.sp),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
            ),
            child: Image.asset(iconPath, fit: BoxFit.cover),
          ),
          6.horizontalSpace,
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
