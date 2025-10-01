import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_text_styles.dart';

/// Ticket Success Screen
/// Screen shown after successful ticket submission
class TicketSuccessScreen extends StatelessWidget {
  /// Ticket Success Screen constructor
  const TicketSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              // Header spacer
              SizedBox(height: 60.h),

              // Success content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Success icon
                    Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(60.r),
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: const Color(0xFF4CAF50),
                        size: 60.w,
                      ),
                    ),

                    SizedBox(height: AppConstants.spacing32),

                    // Success title
                    Text(
                      'Ticket Submitted!',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Success message
                    Text(
                      'Your support ticket has been successfully submitted. Our team will review it and get back to you within 24-48 hours.',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Ticket ID (simulated)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.confirmation_number,
                            color: AppColors.primary,
                            size: 18.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Ticket ID: #${_generateTicketId()}',
                            style: AppTextStyles.labelMedium.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Action buttons
              Column(
                children: [
                  // Back to Support button
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFA13FD3), Color(0xFF6A5AE0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
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
                          'Back to Support',
                          style: AppTextStyles.labelLarge.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppConstants.spacing16),

                  // View Tickets button
                  GestureDetector(
                    onTap: () => _viewTickets(),
                    child: Container(
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'View My Tickets',
                          style: AppTextStyles.labelLarge.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppConstants.spacing32),
            ],
          ),
        ),
      ),
    );
  }

  /// Generates a random ticket ID for display
  String _generateTicketId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'ST${timestamp.toString().substring(7)}';
  }

  /// Handles view tickets action
  void _viewTickets() {
    // Navigate to tickets list screen (would be implemented later)
    Get.snackbar(
      'Coming Soon',
      'Ticket history feature will be available soon',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      colorText: AppColors.primary,
      margin: EdgeInsets.all(16.w),
      borderRadius: 12.r,
    );
  }
}
