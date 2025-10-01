import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_appbar.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/map/controllers/spot_details_controller.dart';
import 'package:ahmedkamal443/features/map/models/details_parking_spot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpotDetailsScreen extends StatelessWidget {
  const SpotDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SpotDetailsController controller = Get.put(SpotDetailsController());
    final spot = controller.getSpotDetails();

    return Scaffold(
      appBar: CommonAppBar(title: 'Spot Details'),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [20.verticalSpace, _buildContentView(spot, controller)],
        ),
      ),
    );
  }

  Widget _buildContentView(
    DetailedParkingSpot spot,
    SpotDetailsController controller,
  ) {
    return Column(
      children: [
        16.verticalSpace,
        _buildImageView(spot),
        24.verticalSpace,
        _buildUserInfoView(controller, spot),
        // 16.verticalSpace,
        _buildTimerView(controller),
        16.verticalSpace,
        _buildFakeSpotReportingView(controller),
        16.verticalSpace,
        _buildSupportView(controller),
        24.verticalSpace,
        CommonButton(
          height: 65.h,
          gradient: LinearGradient(
            begin: Alignment(-0.99, 8.97),
            end: Alignment(1.00, 0.50),
            colors: [const Color(0xFFE3C0F5), const Color(0xFF6A5AE0)],
          ),
          text: 'Navigate to Spot',
          onPressed: () => controller.navigateToSpot(),
        ),

        20.verticalSpace,
      ],
    );
  }

  Widget _buildSupportView(SpotDetailsController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/support.png',
          ), // or NetworkImage('url')
          fit: BoxFit.cover,
        ),
      ),

      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Support the reporter with a tip',
                style: getTextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              16.verticalSpace,
              CommonButton(
                text: 'Send a Gfit',
                onPressed: () => controller.navigateToGiftScreen(),
                height: 37.h,
                width: 123.w,
                fontWeight: FontWeight.w500,
                borderRadius: 20,
                gradient: LinearGradient(
                  begin: Alignment(-0.99, 8.97),
                  end: Alignment(1.00, 0.50),
                  colors: [const Color(0xFFE3C0F5), const Color(0xFF6A5AE0)],
                ),
                margin: EdgeInsets.all(0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFakeSpotReportingView(SpotDetailsController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadows: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 16.10,
            offset: Offset(0, 9),
            spreadRadius: 0,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Fake Spot Reporting',
                style: getTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text151515,
                ),
              ),
              Spacer(),
              Image.asset('assets/icons/danger.png', height: 39.h, width: 39.w),
            ],
          ),

          8.verticalSpace,

          Text(
            'Report as taken/fake* to let others downvote it.',
            style: getTextStyle(fontSize: 12.sp, color: AppColors.text161616),
          ),

          16.verticalSpace,
          CommonButton(
            text: 'Report as Fake/Taken',
            // fontSize: 12.sp,
            onPressed: () {
              controller.showReportDialog();
            },
            borderRadius: 20,
            height: 45.h,
            // width: 158.w,
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerView(SpotDetailsController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.redOpacity,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer_outlined, color: AppColors.error, size: 20.sp),
          8.horizontalSpace,
          Obx(
            () => Text(
              'Expires in ${controller.timeRemaining.value}',
              style: getTextStyle(
                color: AppColors.red,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoView(
    SpotDetailsController controller,
    DetailedParkingSpot spot,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'User Info',
                style: getTextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text151515,
                ),
              ),
              Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: ShapeDecoration(
                  color: const Color(0x338EDB2C),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF8EDB2D)),
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
                child: Text(
                  controller.getStatusText(spot.status),
                  style: getTextStyle(
                    color: AppColors.statusColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          16.verticalSpace,

          Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: NetworkImage(spot.reporter.avatarUrl),
                    onBackgroundImageError: (error, stackTrace) =>
                        Icon(Icons.person),
                  ),

                  12.horizontalSpace,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: ShapeDecoration(
                          color: const Color(0x167E6DFB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                        ),
                        child: Text(
                          'Reported by',
                          style: getTextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFF7E6DFB),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        spot.reporter.name,
                        style: getTextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.text161616,
                        ),
                      ),
                      4.verticalSpace,
                    ],
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20.sp,
                    color: AppColors.primary,
                  ),
                  4.horizontalSpace,
                  Expanded(
                    child: Text(
                      spot.address,
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text161616,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageView(DetailedParkingSpot spot) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),

        image: DecorationImage(
          image: NetworkImage(spot.imageUrl),
          fit: BoxFit.cover,
          onError: (error, stackTrace) => Container(
            color: Colors.grey[300],
            child: Icon(Icons.local_parking, size: 50.sp),
          ),
        ),
      ),
    );
  }
}
