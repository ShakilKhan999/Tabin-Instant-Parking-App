import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/mark_spot/controllers/mark_spot_controller.dart';
import 'package:ahmedkamal443/features/mark_spot/views/widgets/status_radio_widget.dart';
import 'package:ahmedkamal443/features/mark_spot/views/widgets/photo_picker_widget.dart';
import 'package:ahmedkamal443/features/mark_spot/views/widgets/location_field_widget.dart';
import 'package:ahmedkamal443/features/mark_spot/views/widgets/notes_field_widget.dart';
import 'package:ahmedkamal443/features/mark_spot/views/widgets/map_widget.dart';
import 'package:ahmedkamal443/features/mark_spot/views/widgets/reward_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Mark Spot Screen
/// Screen for marking parking spots as available or occupied
class MarkSpotScreen extends StatelessWidget {
  /// Mark Spot Screen constructor
  const MarkSpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MarkSpotController controller = Get.put(MarkSpotController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and title
              _buildHeader(),

              SizedBox(height: 37.h),

              // Main content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status section
                    _buildStatusSection(controller),

                    SizedBox(height: 28.h),

                    // Photo picker section
                    const PhotoPickerWidget(),

                    SizedBox(height: 21.h),

                    // GPS Location section
                    _buildLocationSection(controller),

                    SizedBox(height: 12.h),

                    // Map widget
                    const MapWidget(),

                    SizedBox(height: 22.h),

                    // Notes section
                    NotesFieldWidget(controller: controller),

                    SizedBox(height: 29.h),

                    // Reward info widgets
                    const RewardInfoWidget(),

                    SizedBox(height: 20.h),

                    // Submit button
                    _buildSubmitButton(controller),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header with back button and title
  Widget _buildHeader() {
    return Container(
      height: 79.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(45.r),
                border: Border.all(
                  color: const Color(0xFFF0EFF1).withValues(alpha: 0.1),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.textPrimary,
                size: 16.w,
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                'Mark Spot',
                style: AppTextStyles.titleLarge.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),

          // Empty space to balance the back button
          SizedBox(width: 45.w),
        ],
      ),
    );
  }

  /// Builds the status section
  Widget _buildStatusSection(MarkSpotController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: AppTextStyles.titleMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: 28.h),

        // Status radio buttons
        Row(
          children: [
            StatusRadioWidget(
              title: 'Available',
              isSelected: controller.selectedStatus.value == 'Available',
              onTap: () => controller.updateStatus('Available'),
            ),

            SizedBox(width: 30.w),

            StatusRadioWidget(
              title: 'Occupied',
              isSelected: controller.selectedStatus.value == 'Occupied',
              onTap: () => controller.updateStatus('Occupied'),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the GPS location section
  Widget _buildLocationSection(MarkSpotController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GPS Location',
          style: AppTextStyles.titleMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: 7.h),

        LocationFieldWidget(controller: controller),
      ],
    );
  }

  /// Builds the submit button
  Widget _buildSubmitButton(MarkSpotController controller) {
    return Obx(
      () => GestureDetector(
        onTap: controller.isLoading.value
            ? null
            : () => controller.submitMarkSpot(),
        child: Container(
          width: double.infinity,
          height: 55.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: controller.isLoading.value
                ? SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.white,
                      ),
                    ),
                  )
                : Text(
                    'Notify Available Spot',
                    style: AppTextStyles.buttonMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
