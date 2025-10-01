import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:ahmedkamal443/features/alerts/controllers/alerts_controller.dart';
import 'package:ahmedkamal443/features/alerts/models/alert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';

/// Add Alert Bottom Sheet
/// Modal dialog for creating new parking alerts
class AddAlertBottomSheet {
  /// Shows the add alert bottom sheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _AddAlertBottomSheetContent(),
    );
  }
}

/// Add Alert Bottom Sheet Content Widget
class _AddAlertBottomSheetContent extends StatefulWidget {
  const _AddAlertBottomSheetContent();

  @override
  State<_AddAlertBottomSheetContent> createState() =>
      _AddAlertBottomSheetContentState();
}

class _AddAlertBottomSheetContentState
    extends State<_AddAlertBottomSheetContent> {
  final TextEditingController _titleController = TextEditingController(
    text: 'Park Avenue',
  );
  final TextEditingController _locationController = TextEditingController(
    text: 'Kağıthane',
  );
  final TextEditingController _timeController = TextEditingController(
    text: '08:40 AM',
  );

  String _selectedRadius = '500m';
  final List<String> _radiusOptions = [
    '100m',
    '200m',
    '500m',
    '1km',
    '2km',
    '5km',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        border: Border.all(color: const Color(0xFFDBDBDB), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: 500.h, maxHeight: 600.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  width: 123.67.w,
                  height: 5.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),

                SizedBox(height: 45.h),

                // Title
                Text(
                  'Add New Alert',
                  style: AppTextStyles.titleLarge.copyWith(
                    fontSize: 24.18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 40.h),

                // Form fields
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      // Title field
                      _buildTextField(
                        controller: _titleController,
                        hintText: 'Alert Title',
                      ),

                      SizedBox(height: 24.h),

                      // Location field
                      _buildTextField(
                        controller: _locationController,
                        hintText: 'Location',
                        suffixIcon: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            shape: BoxShape.circle,
                          ),
                          child: Transform.scale(
                            scale: 0.6,
                            child: Image.asset(
                              IconPath.location,
                              color: AppColors.primary,
                              height: 19.2.sp,
                              width: 19.2.sp,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Time field
                      _buildTextField(
                        controller: _timeController,
                        hintText: 'Time',
                        suffixIcon: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            shape: BoxShape.circle,
                          ),
                          child: Transform.scale(
                            scale: 0.6,
                            child: Image.asset(
                              IconPath.clock,
                              color: AppColors.primary,
                              height: 19.2.sp,
                              width: 19.2.sp,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Radius dropdown
                      _buildDropdownField(),

                      SizedBox(height: 40.h),

                      // Save button
                      _buildSaveButton(),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds text field with custom styling
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(13.674.r),
        border: Border.all(color: const Color(0xFF7B7DFF), width: 1.14),
      ),
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.bodyLarge.copyWith(
          fontSize: 16.sp,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyLarge.copyWith(
            fontSize: 16.sp,
            color: AppColors.textSecondary,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,

          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            minWidth: 32.w,
            minHeight: 32.h,
          ),
        ),
      ),
    );
  }

  /// Builds dropdown field for radius selection
  Widget _buildDropdownField() {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(13.674.r),
        border: Border.all(color: const Color(0xFF7B7DFF), width: 1.14),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedRadius,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,

          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
        ),
        style: AppTextStyles.bodyLarge.copyWith(
          fontSize: 16.sp,
          color: AppColors.textPrimary,
        ),
        dropdownColor: AppColors.white,
        iconEnabledColor: AppColors.textPrimary,
        items: _radiusOptions.map((String radius) {
          return DropdownMenuItem<String>(
            value: radius,
            child: Text(
              radius,
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: 16.sp,
                color: AppColors.textPrimary,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedRadius = newValue;
            });
          }
        },
      ),
    );
  }

  /// Builds save button
  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFA13FD3), Color(0xFF6A5AE0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleSaveAlert,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          child: Center(
            child: Text(
              'Save Alert',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Handles save alert action
  void _handleSaveAlert() {
    // Validate inputs
    if (_titleController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _timeController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Create new alert
    final newAlert = AlertModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      location: _locationController.text,
      time: _timeController.text,
      radius: _selectedRadius,
      isActive: true,
      createdAt: DateTime.now(),
    );

    // Get controller and add alert
    final AlertsController controller = Get.find<AlertsController>();
    controller.addAlert(newAlert);

    // Close bottom sheet
    Navigator.of(context).pop();
  }
}
