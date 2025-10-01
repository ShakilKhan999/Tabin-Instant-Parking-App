import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/profile/views/widgets/profile_header_widget.dart';
import 'package:ahmedkamal443/features/profile/views/widgets/profile_stats_widget.dart';
import 'package:ahmedkamal443/features/profile/views/widgets/quick_links_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Profile screen widget
/// Displays user profile with stats and quick links as per Figma design
class ProfileScreen extends StatelessWidget {
  /// Profile screen constructor
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                // Profile picture and name
                const ProfileHeaderWidget(),

                SizedBox(height: AppConstants.spacing24),

                // Stats card (Gift, Points, Badge Level)
                const ProfileStatsWidget(),

                SizedBox(height: AppConstants.spacing32),

                // Quick Links section
                Text('Quick Links', style: AppTextStyles.headlineMedium),

                SizedBox(height: AppConstants.spacing16),

                // Quick links list
                const QuickLinksWidget(),

                SizedBox(height: AppConstants.spacing32),
                SizedBox(height: 80.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the header with back button and title
  Widget _buildHeader() {
    return Center(
      child: Text(
        'Profile',
        style: AppTextStyles.titleLarge.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
