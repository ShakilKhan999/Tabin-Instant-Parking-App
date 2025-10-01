import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_appbar.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_textfield.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';

import 'package:ahmedkamal443/features/home/controller/save_route_controller.dart';
import 'package:ahmedkamal443/features/home/models/save_route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SavedRoutesScreen extends StatelessWidget {
  const SavedRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SavedRoutesController controller = Get.put(SavedRoutesController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: "Saved Routes"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: _buildHeader(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : _buildRoutesList(controller),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: CommonButton(
        height: 65.h,
        icon: Container(
          height: 24.h,
          width: 24.w,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset('assets/icons/add_icon.png'),
        ),
        text: 'Add New Route',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        onPressed: () => _showAddRouteBottomSheet(controller),
        gradient: LinearGradient(
          begin: Alignment(-0.99, 8.97),
          end: Alignment(1.00, 0.50),
          colors: [const Color(0xFFE3C0F5), const Color(0xFF6A5AE0)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildHeader() {
    return Text(
      'Manage your saved routes for quick access',
      style: TextStyle(
        fontSize: 18.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildRoutesList(SavedRoutesController controller) {
    if (controller.savedRoutes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.route, size: 64.sp, color: Colors.grey[300]),
            16.verticalSpace,
            Text(
              'No saved routes yet',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),
            ),
            8.verticalSpace,
            Text(
              'Add your first route to get started',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 130.h),
      itemCount: controller.savedRoutes.length,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        final route = controller.savedRoutes[index];
        return _buildRouteCard(route, controller);
      },
    );
  }

  Widget _buildRouteCard(SavedRoute route, SavedRoutesController controller) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: route.startLocation,
                        style: getTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      TextSpan(
                        text: ' → ',
                        style: getTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: route.endLocation,
                        style: getTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleFavorite(route.id),
                    child: Image.asset(
                      'assets/icons/edit.png',
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  12.horizontalSpace,
                  GestureDetector(
                    onTap: () => controller.deleteRoute(route.id),
                    child: Image.asset(
                      'assets/icons/delete.png',
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRoutePoint(
                imagePath: 'assets/icons/home_route.png',
                label: 'Start Location:',
                value: route.startLocation,
              ),
              _buildRoutePoint(
                imagePath: 'assets/icons/home_route.png',
                label: 'Distance:',
                value: route.distance,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRoutePoint(
                imagePath: 'assets/icons/location_secondary.png',
                label: 'End:',
                value: route.endLocation,
              ),
              _buildRoutePoint(
                imagePath: 'assets/icons/location_secondary.png',
                label: 'Est. Time: ',
                value: route.estimatedTime,
              ),
            ],
          ),
          20.verticalSpace,

          CommonButton(
            margin: EdgeInsets.zero,
            text: 'View On Map',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 45.h,
            padding: EdgeInsets.zero,
            borderRadius: 20.r,
            onPressed: () => controller.viewRouteOnMap(route),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutePoint({
    required String imagePath,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Image.asset(imagePath, height: 24.h, width: 24.w),
        8.horizontalSpace,
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
        5.horizontalSpace,
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  void _showAddRouteBottomSheet(SavedRoutesController controller) {
    controller.showAddNewRouteBottomSheet();
    Get.bottomSheet(
      _buildAddNewRouteBottomSheet(controller),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      ignoreSafeArea: false, // Important: Let Flutter handle safe area properly
    ).then((_) {
      controller.isBottomSheetOpen.value = false;
    });
  }

  Widget _buildAddNewRouteBottomSheet(SavedRoutesController controller) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.7,
          minHeight: Get.height * 0.5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 123.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                'Add New Route',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextField(
                      borderColor: AppColors.textFiledColor,
                      controller: controller.routeTitleController,
                      hintText: 'Route Title',
                      prefixIcon: null,
                    ),
                    16.verticalSpace,
                    CommonTextField(
                      borderColor: AppColors.textFiledColor,
                      controller: controller.startLocationController,
                      hintText: 'Cambria',
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(6.0.sp),
                        child: Image.asset(
                          'assets/icons/location_secondary.png',
                          height: 15.h,
                          width: 15.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              size: 48.sp,
                              color: Colors.grey[400],
                            ),
                            8.verticalSpace,
                            Text(
                              'Map will be shown here',
                              style: getTextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    CommonTextField(
                      borderColor: AppColors.textFiledColor,
                      controller: controller.destinationController,
                      hintText: 'Destination',
                      prefixIcon: null,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(6.0.sp),
                        child: Image.asset(
                          'assets/icons/location_secondary.png',
                          height: 15.h,
                          width: 15.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    40.verticalSpace,
                    // Button with proper spacing
                    Obx(
                      () => CommonButton(
                        text: 'Save Route',
                        onPressed: controller.isFormValid.value
                            ? () => controller.saveNewRoute()
                            : () {},
                        // isEnabled: controller.isFormValid.value,
                        height: 62.h,
                        margin: EdgeInsets.zero,
                        gradient: LinearGradient(
                          begin: Alignment(-0.99, 8.97),
                          end: Alignment(1.00, 0.50),
                          colors: [
                            const Color(0xFFE3C0F5),
                            const Color(0xFF6A5AE0),
                          ],
                        ),
                        backgroundColor: controller.isFormValid.value
                            ? null
                            : Colors.grey[300],
                      ),
                    ),
                    // Extra space at bottom for keyboard
                    SizedBox(
                      height: MediaQuery.of(Get.context!).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
