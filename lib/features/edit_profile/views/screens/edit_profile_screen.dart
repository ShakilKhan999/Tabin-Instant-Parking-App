import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:ahmedkamal443/features/edit_profile/views/widgets/profile_image_widget.dart';
import 'package:ahmedkamal443/features/edit_profile/views/widgets/profile_text_field_widget.dart';

/// Edit Profile screen widget
/// Allows users to edit their profile information with image upload
class EditProfileScreen extends StatelessWidget {
  /// Edit Profile screen constructor
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConstants.spacing20),

                // Header with back button and title
                _buildHeader(),

                SizedBox(height: AppConstants.spacing32),

                // Profile image with edit button
                const ProfileImageWidget(),

                SizedBox(height: AppConstants.spacing32),

                // Form fields
                _buildFormFields(controller),

                SizedBox(height: AppConstants.spacing32),

                // Action buttons
                _buildActionButtons(controller),

                SizedBox(height: AppConstants.spacing32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the header with back button and title
  Widget _buildHeader() {
    return Row(
      children: [
        // Back button
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusCircular,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.w,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: Text(
              'Edit Profile',
              style: AppTextStyles.titleLarge.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),

        // Empty space to balance the back button
        SizedBox(width: 50.w),
      ],
    );
  }

  /// Builds the form fields section
  Widget _buildFormFields(EditProfileController controller) {
    return Column(
      children: [
        // Name field
        Obx(
          () => ProfileTextFieldWidget(
            controller: controller.nameController,
            iconPath: SvgPath.userIcon,
            hintText: 'Full Name',
            isError: controller.nameError.value,
            onChanged: (value) {
              if (controller.nameError.value && value.isNotEmpty) {
                controller.nameError.value = false;
              }
            },
          ),
        ),

        SizedBox(height: 20.h),

        // Password field
        Obx(
          () => ProfileTextFieldWidget(
            controller: controller.passwordController,
            iconPath: SvgPath.keyIcon,
            hintText: 'Password',
            isPassword: true,
            isPasswordVisible: controller.isPasswordVisible.value,
            onPasswordToggle: controller.togglePasswordVisibility,
            isError: controller.passwordError.value,
            onChanged: (value) {
              if (controller.passwordError.value && value.isNotEmpty) {
                controller.passwordError.value = false;
              }
            },
          ),
        ),

        SizedBox(height: 20.h),

        // Email field
        Obx(
          () => ProfileTextFieldWidget(
            controller: controller.emailController,
            iconPath: SvgPath.emailIcon,
            hintText: 'Email Address',
            isError: controller.emailError.value,
            onChanged: (value) {
              if (controller.emailError.value && value.isNotEmpty) {
                controller.emailError.value = false;
              }
            },
          ),
        ),

        SizedBox(height: 20.h),

        // Phone field
        Obx(
          () => ProfileTextFieldWidget(
            controller: controller.phoneController,
            iconPath: SvgPath.phoneIcon,
            hintText: 'Phone Number',
            isError: controller.phoneError.value,
            onChanged: (value) {
              if (controller.phoneError.value && value.isNotEmpty) {
                controller.phoneError.value = false;
              }
            },
          ),
        ),

        SizedBox(height: 20.h),

        // Company field (with dropdown arrow)
        Obx(
          () => ProfileTextFieldWidget(
            controller: controller.companyController,
            iconPath: SvgPath.buildingIcon,
            hintText: 'Company',
            isError: controller.companyError.value,
            // suffixIcon: Transform.rotate(
            //   angle: 1.5708, // 90 degrees in radians
            //   child: SvgPicture.asset(
            //     SvgPath.backButton,
            //     width: 16.w,
            //     height: 16.h,
            //     colorFilter: const ColorFilter.mode(
            //       AppColors.textPrimary,
            //       BlendMode.srcIn,
            //     ),
            //   ),
            // ),
            onChanged: (value) {
              if (controller.companyError.value && value.isNotEmpty) {
                controller.companyError.value = false;
              }
            },
          ),
        ),
      ],
    );
  }

  /// Builds the action buttons (Save and Cancel)
  Widget _buildActionButtons(EditProfileController controller) {
    return Column(
      children: [
        // Save Changes button
        Obx(
          () => GestureDetector(
            onTap: controller.isLoading.value ? null : controller.saveChanges,
            child: Container(
              width: double.infinity,
              height: 65.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: controller.isLoading.value
                      ? [AppColors.textSecondary, AppColors.textSecondary]
                      : [Color(0xFFA13FD3), Color(0xFF6A5AE0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
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
                        'Save Changes',
                        style: AppTextStyles.labelLarge.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
              ),
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Cancel button
        GestureDetector(
          onTap: controller.cancelChanges,
          child: Container(
            width: double.infinity,
            height: 65.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.primary, width: 1.5),
            ),
            child: Center(
              child: Text(
                'Cancel',
                style: AppTextStyles.labelLarge.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
