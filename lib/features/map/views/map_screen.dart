import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_back_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_textfield.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/map/controllers/map_controller.dart';
import 'package:ahmedkamal443/features/map/views/parking_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());

    return Scaffold(
      body: Stack(
        children: [
          // Map/Background Area
          Obx(
            () => controller.showMap.value
                ? _buildMapArea()
                : _buildPlaceholderArea(),
          ),

          // Overlay Header
          _buildOverlayHeader(controller),

          // Bottom Sheet
          Obx(
            () =>
                controller.showBottomSheet.value &&
                    controller.selectedSpot.value != null
                ? _buildBottomSheet(controller)
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderArea() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, size: 80.sp, color: Colors.grey[400]),
            16.verticalSpace,
            Text(
              'Tap the map icon to load map',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapArea() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[300],
      child: Stack(
        children: [
          // Simulated map background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey[200]!, Colors.grey[400]!],
              ),
            ),
          ),
          // Dummy map pins
          ...List.generate(
            5,
            (index) => Positioned(
              left: (index * 80 + 50).w,
              top: (index * 100 + 200).h,
              child: GestureDetector(
                onTap: () => Get.find<MapController>().selectParkingSpot(
                  Get.find<MapController>().parkingSpots[index % 3],
                ),
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.green : Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlayHeader(MapController controller) {
    return Positioned(
      top: 50.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        children: [
          CommonBackButton(),
          12.horizontalSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    height: 50.h,
                    borderRadius: 15,
                    borderColor: Colors.transparent,
                    controller: controller.secarchController,
                    hintText: 'Search location',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.0.sp),
                      child: Image.asset(
                        'assets/icons/search.png',
                        height: 10.h,
                        width: 10.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => controller.toggleFilter(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 8.0.w,
                          left: 8.w,
                          top: 6.h,
                          bottom: 6.h,
                        ),
                        child: Container(
                          width: 40.w,
                          height: 40.w,

                          decoration: BoxDecoration(
                            color: controller.selectedFilter.value == 'Free'
                                ? Colors.purple[100]
                                : Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Image.asset(
                            'assets/icons/filter.png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.cover,
                            // color: controller.selectedFilter.value == 'Free'
                            //     ? Colors.purple
                            //     : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          12.horizontalSpace,

          // Obx(
          //   () => GestureDetector(
          //     onTap: () => controller.toggleFilter(),
          //     child: Container(
          //       width: 40.w,
          //       height: 40.w,
          //       decoration: BoxDecoration(
          //         color: controller.selectedFilter.value == 'Free'
          //             ? Colors.purple[100]
          //             : Colors.white.withOpacity(0.9),
          //         borderRadius: BorderRadius.circular(8.r),
          //       ),
          //       child: Icon(
          //         Icons.tune,
          //         size: 20.sp,
          //         color: controller.selectedFilter.value == 'Free'
          //             ? Colors.purple
          //             : Colors.grey[600],
          //       ),
          //     ),
          //   ),
          // ),

          // 8.horizontalSpace,

          // Map toggle button
          GestureDetector(
            onTap: () => controller.toggleMap(),
            child: Image.asset(
              'assets/icons/map.png',
              height: 43.h,
              width: 43.w,
              fit: BoxFit.cover,
              // color: controller.showMap.value
              //     ? Colors.purple
              //     : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(MapController controller) {
    final spot = controller.selectedSpot.value!;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => controller.hideBottomSheet(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              15.verticalSpace,
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: 88.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.bottomSheetDividerColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),

              Container(
                margin: EdgeInsets.all(16.w),
                padding: EdgeInsets.all(16.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.local_parking,
                            color: Colors.grey[600],
                            size: 30.sp,
                          ),
                        ),

                        12.horizontalSpace,

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      spot.name,
                                      style: getTextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  if (spot.isAvailable)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 18.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: const Color(0x338EDB2C),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.16,
                                            color: const Color(0xFF8EDB2D),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            23.13,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Available',
                                        style: getTextStyle(
                                          fontSize: 13.sp,
                                          color: AppColors.green61991A,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              4.verticalSpace,
                              Text(
                                spot.address,
                                style: getTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greySubtitle,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Updated: ${spot.updatedTime}',
                                style: getTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    16.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoContainer(
                          iconPath: 'assets/icons/location.png',
                          value: spot.distance,
                          color: Color(0xff1E1756),
                          backgroundColor: Colors.red,
                        ),

                        _buildInfoContainer(
                          iconPath: 'assets/icons/routing.png',
                          value: spot.time,
                          color: Color(0xff1E1756),
                          backgroundColor: Colors.red,
                        ),

                        _buildInfoContainer(
                          iconPath: 'assets/icons/free_tag.png',
                          value: spot.isFree ? 'Free' : 'Paid',
                          color: Color(0xff1E1756),
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),

                    20.verticalSpace,

                    CommonButton(
                      height: 72.h,
                      text: 'View Details',
                      onPressed: () {
                        Get.to(() => ParkingListScreen());
                      },
                      margin: EdgeInsets.all(0),
                    ),
                  ],
                ),
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
