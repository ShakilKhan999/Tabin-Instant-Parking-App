import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/help_support/controllers/help_support_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/constants/app_colors.dart';

/// Contact Us Tab Widget
/// Displays contact information and feedback form
class ContactUsTabWidget extends StatelessWidget {
  /// Contact Us Tab Widget constructor
  const ContactUsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpSupportController controller = Get.find<HelpSupportController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact details section
        _buildContactDetailsSection(controller),

        SizedBox(height: AppConstants.spacing32),

        // Send feedback section
        _buildFeedbackSection(controller),
      ],
    );
  }

  /// Builds contact details section
  Widget _buildContactDetailsSection(HelpSupportController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact details',
          style: AppTextStyles.headlineSmall.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: AppConstants.spacing16),

        // Phone contact
        _buildContactItem(
          icon: SvgPath.call,
          iconColor: AppColors.primary,
          label: 'Call Us:',
          value: '+1 800 123 4567',
          onTap: () => controller.makePhoneCall(),
        ),

        SizedBox(height: AppConstants.spacing15),

        // Email contact
        _buildContactItem(
          icon: SvgPath.email,
          iconColor: AppColors.primary,
          label: 'Email:',
          value: 'support@tabin.app',
          onTap: () => controller.sendEmail(),
        ),

        SizedBox(height: AppConstants.spacing15),

        // Support ticket
        _buildSupportTicketItem(controller),
      ],
    );
  }

  /// Builds individual contact item
  Widget _buildContactItem({
    required String icon,
    required Color iconColor,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80.h,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 37.w,
              height: 37.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Transform.scale(
                scale: 0.6.r,
                child: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),

            SizedBox(width: AppConstants.spacing16),

            // Contact info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xFF919191),
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    value,
                    style: AppTextStyles.labelMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds support ticket item with submit button
  Widget _buildSupportTicketItem(HelpSupportController controller) {
    return Container(
      width: double.infinity,
      height: 80.h,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            width: 37.w,
            height: 37.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Transform.scale(
              scale: 0.6.r,
              child: SvgPicture.asset(
                SvgPath.ticket,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),

          SizedBox(width: AppConstants.spacing16),

          // Support ticket text
          Expanded(
            child: Text(
              'Support ticket',
              style: AppTextStyles.labelMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Submit ticket button
          GestureDetector(
            onTap: () => controller.submitSupportTicket(),
            child: Container(
              width: 135.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  'Submit Ticket',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds feedback section
  Widget _buildFeedbackSection(HelpSupportController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send Feedback',
          style: AppTextStyles.headlineSmall.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: AppConstants.spacing16),

        // Feedback text field
        Container(
          height: 137.h,
          decoration: BoxDecoration(
            color: const Color(0xFFEEF1FB).withValues(alpha: 0.19),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: const Color(0xFFCBD3FF).withValues(alpha: 0.6),
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller.feedbackController,
            maxLines: null,
            expands: true,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: 'Describe your issue or feedback here',
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                color: const Color(0xFFA4A4A4),
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(21.w),
            ),
            textAlignVertical: TextAlignVertical.top,
          ),
        ),

        SizedBox(height: AppConstants.spacing20),

        // Submit button
        _buildSubmitButton(controller),
      ],
    );
  }

  /// Builds submit feedback button
  Widget _buildSubmitButton(HelpSupportController controller) {
    return GestureDetector(
      onTap: () => controller.submitFeedback(),
      child: Container(
        width: double.infinity,
        height: 65.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA13FD3), Color(0xFF6A5AE0)],
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
          child: Text(
            'Submit',
            style: AppTextStyles.labelLarge.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
