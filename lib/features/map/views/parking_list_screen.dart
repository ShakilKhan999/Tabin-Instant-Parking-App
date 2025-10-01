import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_back_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_textfield.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/features/map/controllers/map_controller.dart';
import 'package:ahmedkamal443/features/map/models/parking_spot_model.dart';
import 'package:ahmedkamal443/features/map/views/spot_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParkingListScreen extends StatelessWidget {
  const ParkingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Header overlay
          Positioned(
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
                                  color:
                                      controller.selectedFilter.value == 'Free'
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,

                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(5.sp),
                    child: Image.asset(
                      'assets/icons/routing.png',
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                      // color: controller.showMap.value
                      //     ? Colors.purple
                      //     : Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List content
          Positioned.fill(
            top: 110.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 40.h,
                  ),
                  child: Text(
                    'Nearby Parking Spots',
                    style: getTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: controller.parkingSpots.length,
                    separatorBuilder: (context, index) => 12.verticalSpace,
                    itemBuilder: (context, index) {
                      final spot = controller.parkingSpots[index];
                      return _buildParkingListItem(spot);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParkingListItem(ParkingSpot spot) {
    return GestureDetector(
      onTap: () => Get.to(() => SpotDetailsScreen()),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.local_parking,
                color: Colors.grey[600],
                size: 25.sp,
              ),
            ),

            12.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    spot.name,
                    style: getTextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    spot.address,
                    style: getTextStyle(
                      fontSize: 12.sp,

                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.chevron_right,
              color: AppColors.textPrimary,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
