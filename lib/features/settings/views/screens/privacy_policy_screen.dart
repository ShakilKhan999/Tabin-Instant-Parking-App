import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';

/// Privacy Policy screen widget
/// Displays privacy policy content with dummy data following the app design
class PrivacyPolicyScreen extends StatelessWidget {
  /// Privacy Policy screen constructor
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            _buildHeader(),

            // Privacy policy content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingLarge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.spacing24),

                    // Introduction section
                    _buildSectionCard(
                      title: 'Introduction',
                      content:
                          'Welcome to TeaBin! Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Information we collect section
                    _buildSectionCard(
                      title: 'Information We Collect',
                      content:
                          'We collect information you provide directly to us, such as when you create an account, update your profile, or contact us for support. This may include your name, email address, phone number, and location data.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // How we use information section
                    _buildSectionCard(
                      title: 'How We Use Your Information',
                      content:
                          'We use the information we collect to provide, maintain, and improve our services, process transactions, send notifications, respond to your comments and questions, and communicate with you.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Information sharing section
                    _buildSectionCard(
                      title: 'Information Sharing',
                      content:
                          'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this Privacy Policy or as required by law.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Data security section
                    _buildSectionCard(
                      title: 'Data Security',
                      content:
                          'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Location services section
                    _buildSectionCard(
                      title: 'Location Services',
                      content:
                          'Our app may collect location data to provide parking spot recommendations and navigation services. You can disable location services at any time through your device settings.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Cookies and tracking section
                    _buildSectionCard(
                      title: 'Cookies and Tracking',
                      content:
                          'We may use cookies and similar tracking technologies to improve your app experience, analyze usage patterns, and personalize content and advertisements.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Your rights section
                    _buildSectionCard(
                      title: 'Your Rights',
                      content:
                          'You have the right to access, update, or delete your personal information. You may also opt out of certain communications from us. Contact us if you wish to exercise these rights.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Changes to policy section
                    _buildSectionCard(
                      title: 'Changes to This Policy',
                      content:
                          'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date.',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Contact section
                    _buildSectionCard(
                      title: 'Contact Us',
                      content:
                          'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: privacy@teabin.com\nPhone: +1 (555) 123-4567\nAddress: 123 Privacy Street, Data City, DC 12345',
                    ),

                    SizedBox(height: AppConstants.spacing16),

                    // Last updated section
                    _buildLastUpdatedSection(),

                    SizedBox(height: AppConstants.spacing32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the header with back button and title
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(AppConstants.paddingLarge),
      child: Row(
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
                  size: 16.w,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                'Privacy Policy',
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
      ),
    );
  }

  /// Builds a section card with title and content
  Widget _buildSectionCard({required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            title,
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: AppConstants.spacing12),

          // Section content
          Text(
            content,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the last updated section
  Widget _buildLastUpdatedSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Last updated icon
          Icon(Icons.update, size: 24.w, color: AppColors.primary),

          SizedBox(height: AppConstants.spacing8),

          // Last updated text
          Text(
            'Last Updated',
            style: AppTextStyles.titleSmall.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),

          SizedBox(height: AppConstants.spacing4),

          // Date
          Text(
            'August 18, 2025',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
