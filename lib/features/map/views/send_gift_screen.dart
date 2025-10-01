import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_appbar.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/map/controllers/spot_details_controller.dart';
import 'package:ahmedkamal443/features/map/models/gift_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendGiftScreen extends StatelessWidget {
  const SendGiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SpotDetailsController controller = Get.find<SpotDetailsController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: 'Send a Gift'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  _buildReporterSectionView(),
                  32.verticalSpace,

                  // Gift Selection
                  Text(
                    'Choose a small thank-you gift:',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      color: AppColors.text161616,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  16.verticalSpace,

                  Container(
                    height: 300.h,

                    child: ListView.builder(
                      itemCount: controller.gifts.length,
                      itemBuilder: (context, index) {
                        return _buildGiftOption(
                          controller.gifts[index],
                          controller,
                        );
                      },
                    ),
                  ),

                  24.verticalSpace,

                  // Balance Card
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icons/point_bg.png',
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
                              'Your Balance:',
                              style: getTextStyle(
                                color: Colors.white70,
                                fontSize: 16.sp,
                              ),
                            ),
                            4.verticalSpace,
                            Obx(
                              () => Text(
                                '${controller.userBalance.value} Points',
                                style: getTextStyle(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  Obx(
                    () => CommonButton(
                      text: 'Send Gift',
                      height: 65.h,
                      fontWeight: FontWeight.w500,
                      margin: EdgeInsets.all(0),
                      isEnabled: controller.selectedGift.value != null,
                      gradient: controller.selectedGift.value != null
                          ? LinearGradient(
                              begin: Alignment(-0.99, 8.97),
                              end: Alignment(1.00, 0.50),
                              colors: [
                                const Color(0xFFE3C0F5),
                                const Color(0xFF6A5AE0),
                              ],
                            )
                          : null,
                      onPressed: () {
                        if (controller.selectedGift.value != null) {
                          controller.sendGift(controller.selectedGift.value!);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReporterSectionView() {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 15.w, top: 20.h, bottom: 23.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reporter Info:',
                style: getTextStyle(
                  fontSize: 16.sp,
                  color: AppColors.text151515,
                  fontWeight: FontWeight.w600,
                ),
              ),
              16.verticalSpace,
              _buildReporterInfoView(
                imagPath: 'assets/icons/home_route.png',
                title: 'Reported by: Basse Cooper',
              ),

              8.verticalSpace,
              _buildReporterInfoView(
                imagPath: 'assets/icons/time_duration.png',
                title: 'Reported: 3 mins ago',
              ),
              8.verticalSpace,
              _buildReporterInfoView(
                imagPath: 'assets/icons/location_secondary.png',
                title: 'Location: 123 Main Street',
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReporterInfoView({
    required String imagPath,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 24.w, height: 24.w, child: Image.asset(imagPath)),
        8.horizontalSpace,
        Text(
          title,
          style: getTextStyle(
            color: AppColors.text161616,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildGiftOption(Gift gift, SpotDetailsController controller) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.selectedGift.value = gift,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: controller.selectedGift.value?.id == gift.id
                ? AppColors.primary.withValues(alpha: 0.2)
                : Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
          ),
          child: Row(
            children: [
              Text(
                gift.icon,
                style: getTextStyle(
                  fontSize: 24.sp,
                  color: AppColors.text161616,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Text(
                  gift.name,
                  style: getTextStyle(
                    fontSize: 16.sp,
                    color: AppColors.text161616,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (controller.selectedGift.value?.id == gift.id)
                Icon(Icons.check_circle, color: AppColors.primary, size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
