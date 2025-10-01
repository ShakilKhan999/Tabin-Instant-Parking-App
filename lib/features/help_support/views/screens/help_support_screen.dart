import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/help_support/controllers/help_support_controller.dart';
import 'package:ahmedkamal443/features/help_support/views/widgets/contact_us_tab_widget.dart';
import 'package:ahmedkamal443/features/help_support/views/widgets/faq_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

/// Help & Support Screen
/// Main screen with FAQ and Contact Us tabs functionality
class HelpSupportScreen extends StatelessWidget {
  /// Help & Support Screen constructor
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpSupportController controller = Get.put(HelpSupportController());

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

                // Search bar
                _buildSearchBar(controller),

                SizedBox(height: AppConstants.spacing24),

                // Tab selector (FAQ / Contact Us)
                _buildTabSelector(controller),

                SizedBox(height: AppConstants.spacing24),

                // Tab content
                Obx(() => _buildTabContent(controller)),

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
              'Help & Support',
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

  /// Builds the search bar
  Widget _buildSearchBar(HelpSupportController controller) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: const Color(0xFFCBD3FF).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller.searchController,
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: 14.sp,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Search FAQs or topics…',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            color: const Color(0xFF9C9C9C),
          ),
          prefixIcon: Container(
            padding: EdgeInsets.all(14.w),
            child: SvgPicture.asset(SvgPath.search, width: 18.w, height: 18.h),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 15.h,
          ),
        ),
        onChanged: (value) => controller.searchQuery.value = value,
      ),
    );
  }

  /// Builds the tab selector (FAQ / Contact Us)
  Widget _buildTabSelector(HelpSupportController controller) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFFCBD3FF).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // FAQ Tab
          Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () => controller.selectedTab.value = 0,
                child: Container(
                  height: 46.h,
                  margin: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == 0
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'FAQ',
                      style: AppTextStyles.labelMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: controller.selectedTab.value == 0
                            ? AppColors.white
                            : const Color(0xFF7F7F7F),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Contact Us Tab
          Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () => controller.selectedTab.value = 1,
                child: Container(
                  height: 46.h,
                  margin: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == 1
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Center(
                    child: Text(
                      'Contact Us',
                      style: AppTextStyles.labelMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: controller.selectedTab.value == 1
                            ? AppColors.white
                            : const Color(0xFF7F7F7F),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the tab content based on selected tab
  Widget _buildTabContent(HelpSupportController controller) {
    if (controller.selectedTab.value == 0) {
      return const FaqTabWidget();
    } else {
      return const ContactUsTabWidget();
    }
  }
}
