import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/profile/views/widgets/contribution_stats_widget.dart';
import 'package:ahmedkamal443/features/profile/views/widgets/report_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyReportsScreen extends StatelessWidget {
  const MyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 24.h),
            _buildSearchSection(),
            SizedBox(height: 24.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildContributionsSection(),
                    SizedBox(height: 24.h),
                    _buildReportsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build header with back button and title
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(45.r),
              ),
              child: Icon(
                Iconsax.arrow_left_2,
                color: AppColors.textPrimary,
                size: 20.sp,
              ),
            ),
          ),
          // Title
          Expanded(
            child: Text(
              'My Reports',
              style: AppTextStyles.headlineLarge.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Spacer to balance the back button
          SizedBox(width: 50.w),
        ],
      ),
    );
  }

  /// Build search bar and filter section
  Widget _buildSearchSection() {
    // Local controller and simple local state using StatefulBuilder to keep this widget functional
    final TextEditingController searchController = TextEditingController();

    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              // Search bar with a functional TextField and clear button
              Expanded(
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 18.w),
                      SvgPicture.asset(
                        SvgPath.search,
                        width: 18.sp,
                        height: 18.sp,
                      ),
                      SizedBox(width: 8.w),
                      // TextField expanded to take remaining space
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          textInputAction: TextInputAction.search,

                          style: AppTextStyles.searchPlaceholder.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search spot..',
                            hintStyle: AppTextStyles.searchPlaceholder.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              // Filter button (unchanged)
              Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Image.asset(
                  IconPath.filter,
                  width: 20.sp,
                  height: 20.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Build contributions stats section
  Widget _buildContributionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Your Contributions',
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        const ContributionStatsWidget(),
      ],
    );
  }

  /// Build reports list
  Widget _buildReportsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Available spot report with action buttons
          ReportCardWidget(
            spotName: 'Block C Benymin',
            address: '123 Main Street Benymin',
            status: 'Available',
            statusColor: AppColors.success,
            reportedTime: '10 mins ago',
            tipsEarned: '\$3',
            likes: 25,
            dislikes: 2,
            showActionButtons: true,
            onDelete: () {
              // Handle delete action
            },
            onEdit: () {
              // Handle edit action
            },
          ),
          SizedBox(height: 16.h),
          // Expired spot report with delete only
          ReportCardWidget(
            spotName: 'Block C Benymin',
            address: '123 Main Street Benymin',
            status: 'Expired',
            statusColor: AppColors.textSecondary,
            reportedTime: '2 hours ago',
            tipsEarned: '\$0',
            likes: 2,
            dislikes: 0,
            showActionButtons: false,
            showDeleteOnly: true,
            onDelete: () {
              // Handle delete action
            },
          ),
          SizedBox(height: 16.h),
          // Available spot with both buttons
          ReportCardWidget(
            spotName: 'Block C Benymin',
            address: '123 Main Street Benymin',
            status: 'Available',
            statusColor: AppColors.success,
            reportedTime: '10 mins ago',
            tipsEarned: '\$3',
            likes: 25,
            dislikes: 2,
            showActionButtons: true,
            onDelete: () {
              // Handle delete action
            },
            onEdit: () {
              // Handle edit action
            },
          ),
          SizedBox(height: 16.h),
          // Reported Taken spot with re-report
          ReportCardWidget(
            spotName: 'Block C Benymin',
            address: '123 Main Street Benymin',
            status: 'Reported Taken',
            statusColor: AppColors.error,
            reportedTime: 'Yesterday',
            tipsEarned: '\$3',
            likes: 25,
            dislikes: 2,
            showActionButtons: false,
            showReReport: true,
            onReReport: () {
              // Handle re-report action
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
