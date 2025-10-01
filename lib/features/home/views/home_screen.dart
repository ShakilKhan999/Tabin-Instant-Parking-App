import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/common/widgets/parking_spot_dialog.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:ahmedkamal443/features/map/views/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ahmedkamal443/features/home/controller/home_controller.dart';
import 'package:ahmedkamal443/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              _buildAppBar(context),
              30.verticalSpace,
              _buildPointsCard(context),
              30.verticalSpace,
              _buildRoutesSection(context),
              30.verticalSpace,
              _buildMapSection(context),
              30.verticalSpace,
              _buildBottomButtons(context),
              90.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, 👋',
              style: getTextStyle(
                fontSize: 16.sp,
                color: AppColors.textLight,
                fontWeight: FontWeight.w500,
              ),
            ),
            5.verticalSpace,
            Obx(
              () => Text(
                'Hello, ${controller.userName}!',
                style: getTextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text161616,
                ),
              ),
            ),
            5.verticalSpace,
            Row(
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.orange,
                  size: 20.sp,
                ),
                5.horizontalSpace,
                Text(
                  '27°C',
                  style: getTextStyle(
                    fontSize: 20.sp,
                    color: AppColors.text161616,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  // Navigate to notifications screen
                  Get.toNamed(AppRoutes.notification);
                },
                icon: Icon(
                  Icons.notifications,
                  size: 28.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
            10.horizontalSpace,
            Stack(
              clipBehavior: Clip.none,
              children: [
                Obx(
                  () => CircleAvatar(
                    radius: 28.sp,
                    backgroundColor: AppColors.primaryBackground,
                    backgroundImage: NetworkImage(
                      controller.userProfileImage.value,
                    ),
                  ),
                ),
                Positioned(
                  top: -7.h,
                  left: -7.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(3.sp),
                    child: Image.asset(
                      'assets/icons/premium.png',
                      height: 23.h,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPointsCard(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 206.h,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF6A5AE0), Color(0xFF7E6DFB)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.r),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: -21.h,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Container(
                    width: 211.w,
                    height: 209.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/onboarding_1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25.w,
                top: 25.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.r),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => Text(
                              controller.badge.value,
                              style: getTextStyle(
                                color: const Color(0xFF7E6DFB),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Image.asset(
                            'assets/icons/premium.png',
                            height: 16.sp,
                            width: 16.sp,
                            // size: 16.sp,
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Points',
                          style: getTextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                '${controller.points}',
                                style: getTextStyle(
                                  color: Colors.white,
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.amber,
                              size: 30.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 38.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF6A5AE0),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFF8A7BF6),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(19.r),
                        bottomRight: Radius.circular(19.r),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Redeem for a Starbucks Coffee!',
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRoutesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Routes',
          style: getTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        20.verticalSpace,
        Obx(
          () => Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectRoute('Home to Work'),
                  child: _buildRouteButton(
                    context,
                    imagePath: 'assets/icons/home_route.png',
                    label: 'Home to Work',
                    isSelected:
                        controller.selectedRoute.value == 'Home to Work',
                  ),
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectRoute('Work to Home'),
                  child: _buildRouteButton(
                    context,
                    imagePath: 'assets/icons/work_route.png',
                    label: 'Work to Home',
                    isSelected:
                        controller.selectedRoute.value == 'Work to Home',
                  ),
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        CommonButton(
          text: 'Manage Routes',
          onPressed: () {
            // if (controller.selectedRoute.value.isNotEmpty) {
            //   Get.toNamed(AppRoutes.routeDetails);
            // }
            Get.toNamed(AppRoutes.savedRoute);
          },
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildRouteButton(
    BuildContext context, {
    required String imagePath,
    required String label,
    required bool isSelected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: isSelected
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.borderColor.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            color: AppColors.primary,
            height: 49.h,
            width: 49.w,
          ),
          Text(
            label,
            style: getTextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        // // color: Colors.red,
        // image: const DecorationImage(
        //   opacity: 0.8,

        //   image: AssetImage('assets/images/maps.png'),

        //   fit: BoxFit.cover,
        // ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.infinity,
              // color: Colors.red,
              child: Image.asset(
                'assets/images/maps.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Obx(
                () => Row(
                  children: [
                    _buildMapFilterRadioButton(
                      context: context,
                      label: 'Free',
                      value: MapFilter.free,
                      groupValue: controller.selectedMapFilter.value,
                      onChanged: (value) => controller.selectMapFilter(value!),
                    ),
                    10.horizontalSpace,
                    _buildMapFilterRadioButton(
                      context: context,
                      label: 'Paid',
                      value: MapFilter.paid,
                      groupValue: controller.selectedMapFilter.value,
                      onChanged: (value) => controller.selectMapFilter(value!),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/icons/navigation_icon.png',
                  fit: BoxFit.cover,
                  // height: 20.h,
                  // width: 20.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapFilterRadioButton({
    required BuildContext context,
    required String label,
    required MapFilter value,
    required MapFilter groupValue,
    required void Function(MapFilter?)? onChanged,
  }) {
    final bool isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged?.call(value),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.primary : AppColors.textPrimary,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: getTextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Color(0xffE6E2FD),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text(
            '5 users found parking this morning near you using TaBin!',
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 13.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        20.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CommonButton(
                text: 'Find Spot Now',
                onPressed: () {
                  Get.to(() => MapScreen());
                },
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),

            Expanded(
              child: CommonButton(
                text: 'Report Spot',
                onPressed: () {
                  // Usage example:
                  Get.dialog(
                    ParkingSpotDialog(
                      onYesPressed: () {
                        Get.back();
                        // Handle find spot logic here
                        print('Finding parking spot...');
                      },
                      onNotNowPressed: () {
                        Get.back();
                        // Handle not now logic here
                        print('Not looking for parking now');
                      },
                    ),
                    barrierDismissible: true,
                  );
                },
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                backgroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
