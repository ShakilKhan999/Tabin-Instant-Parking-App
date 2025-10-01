import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/support_ticket/controllers/support_ticket_controller.dart';
import 'package:ahmedkamal443/features/support_ticket/views/widgets/attached_image_widget.dart';
import 'package:ahmedkamal443/features/support_ticket/views/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'ticket_success_screen.dart';

/// Support Ticket Screen
/// Screen for submitting support tickets with image attachments
class SupportTicketScreen extends StatelessWidget {
  /// Support Ticket Screen constructor
  const SupportTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SupportTicketController controller = Get.put(
      SupportTicketController(),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConstants.spacing20),

                // Header with back button and title
                _buildHeader(),

                SizedBox(height: AppConstants.spacing32),

                // Form section
                _buildFormSection(controller),

                SizedBox(height: AppConstants.spacing32),

                // Submit button
                _buildSubmitButton(controller),

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
              'Submit a Ticket',
              style: AppTextStyles.titleLarge.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        // Empty space to balance the back button
        SizedBox(width: 50.w),
      ],
    );
  }

  /// Builds the form section with all input fields
  Widget _buildFormSection(SupportTicketController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          'Submit Ticket details',
          style: AppTextStyles.headlineSmall.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: AppConstants.spacing20),

        // Subject field
        _buildTextField(
          controller: controller.subjectController,
          hintText: 'Subject',
          isError: controller.subjectError,
        ),

        SizedBox(height: 30.h),

        // Category dropdown
        _buildCategoryDropdown(controller),

        SizedBox(height: 30.h),

        // Description field
        _buildTextField(
          controller: controller.descriptionController,
          hintText: 'Description',
          maxLines: 6,
          height: 163.h,
          isError: controller.descriptionError,
        ),

        SizedBox(height: 30.h),

        // Attach screenshot section
        _buildAttachmentSection(controller),
      ],
    );
  }

  /// Builds text field with consistent styling
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    double? height,
    required RxBool isError,
  }) {
    return Obx(
      () => Container(
        height: height ?? 65.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(13.674.r),
          border: Border.all(
            color: isError.value ? AppColors.error : const Color(0xFF7B7DFF),
            width: 1.14,
          ),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize: 16.sp,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyLarge.copyWith(
              fontSize: 16.sp,
              color: const Color(0xFF9092A3),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: maxLines > 1 ? 23.h : 23.h,
            ),
          ),
          textAlignVertical: maxLines > 1
              ? TextAlignVertical.top
              : TextAlignVertical.center,
          onChanged: (value) {
            // Clear error when user starts typing
            if (isError.value && value.isNotEmpty) {
              isError.value = false;
            }
          },
        ),
      ),
    );
  }

  /// Builds category dropdown field
  Widget _buildCategoryDropdown(SupportTicketController controller) {
    return Obx(
      () => Container(
        height: 65.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(13.674.r),
          border: Border.all(
            color: controller.categoryError.value
                ? AppColors.error
                : const Color(0xFF7B7DFF),
            width: 1.14,
          ),
        ),
        child: DropdownButtonFormField<String>(
          value: controller.selectedCategory.value.isEmpty
              ? null
              : controller.selectedCategory.value,
          decoration: InputDecoration(
            hintText: 'Category',
            hintStyle: AppTextStyles.bodyLarge.copyWith(
              fontSize: 16.sp,
              color: const Color(0xFF9092A3),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
          ),
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize: 16.sp,
            color: AppColors.textPrimary,
          ),
          dropdownColor: AppColors.surface,
          iconEnabledColor: AppColors.textPrimary,
          items: controller.categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(
                category,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller.selectedCategory.value = newValue;
              if (controller.categoryError.value) {
                controller.categoryError.value = false;
              }
            }
          },
          icon: Container(
            margin: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset(
              SvgPath.downArrow,
              colorFilter: ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds attachment section with image picker
  Widget _buildAttachmentSection(SupportTicketController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attach Screenshot',
          style: AppTextStyles.labelMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: AppConstants.spacing20),

        // Attached images
        Obx(
          () => controller.attachedImages.isNotEmpty
              ? _buildAttachedImagesList(controller)
              : const SizedBox.shrink(),
        ),

        // Image picker
        const ImagePickerWidget(),
      ],
    );
  }

  /// Builds list of attached images
  Widget _buildAttachedImagesList(SupportTicketController controller) {
    return Column(
      children: [
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: controller.attachedImages.asMap().entries.map((entry) {
            final index = entry.key;
            final image = entry.value;
            return AttachedImageWidget(
              imageFile: image,
              onRemove: () => controller.removeImage(index),
            );
          }).toList(),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  /// Builds submit button
  Widget _buildSubmitButton(SupportTicketController controller) {
    return Obx(
      () => GestureDetector(
        onTap: controller.isLoading.value
            ? null
            : () => _handleSubmit(controller),
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
                    'Submit Ticket',
                    style: AppTextStyles.labelLarge.copyWith(
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

  /// Handles submit button tap
  void _handleSubmit(SupportTicketController controller) {
    if (controller.validateForm()) {
      controller.submitTicket().then((_) {
        // Navigate to success screen
        Get.off(() => const TicketSuccessScreen());
      });
    }
  }
}
