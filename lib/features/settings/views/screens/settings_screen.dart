import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/settings/controllers/settings_controller.dart';
import 'package:ahmedkamal443/features/settings/views/widgets/settings_section_widget.dart';
import 'package:ahmedkamal443/features/settings/views/widgets/settings_item_widget.dart';

/// Settings screen widget
/// Displays app settings with sections and toggles as per Figma design
class SettingsScreen extends StatelessWidget {
  /// Settings screen constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppConstants.spacing20),

              // Header with back button and title
              _buildHeader(),

              SizedBox(height: AppConstants.spacing32),

              // Settings content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Account Settings Section
                      SettingsSectionWidget(
                        title: 'Account Settings',
                        children: [
                          SettingsItemWidget(
                            icon: _buildIcon(
                              isImage: true,
                              path: IconPath.editProfile,
                            ),
                            title: 'Edit Profile',
                            onTap: controller.navigateToEditProfile,
                          ),
                        ],
                      ),

                      SizedBox(height: AppConstants.spacing32),

                      // Notifications Settings Section
                      SettingsSectionWidget(
                        title: 'Notifications Settings',
                        children: [
                          Obx(
                            () => SettingsItemWidget(
                              icon: _buildIcon(
                                isImage: true,
                                path: IconPath.pushNotifications,
                              ),
                              title: 'Push Notifications',
                              hasSwitch: true,
                              switchValue: controller.pushNotifications.value,
                              onSwitchToggle:
                                  controller.togglePushNotifications,
                            ),
                          ),
                          Obx(
                            () => SettingsItemWidget(
                              icon: _buildIcon(
                                isImage: true,
                                path: IconPath.nearbySpotAlerts,
                              ),
                              title: 'Nearby Spot Alerts',
                              hasSwitch: true,
                              switchValue: controller.nearbySpotAlerts.value,
                              onSwitchToggle: controller.toggleNearbySpotAlerts,
                            ),
                          ),
                          Obx(
                            () => SettingsItemWidget(
                              icon: _buildIcon(
                                isImage: true,
                                path: IconPath.tipsRewardsAlerts,
                              ),
                              title: 'Tips & Rewards Alerts',
                              hasSwitch: true,
                              switchValue:
                                  controller.tipsAndRewardsAlerts.value,
                              onSwitchToggle:
                                  controller.toggleTipsAndRewardsAlerts,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: AppConstants.spacing32),

                      // Privacy & Security Section
                      SettingsSectionWidget(
                        title: 'Privacy & Security',
                        children: [
                          Obx(
                            () => SettingsItemWidget(
                              icon: _buildIcon(
                                isImage: true,
                                path: IconPath.twoFactorAuth,
                              ),
                              title: 'Two‑Factor Authentication',
                              hasSwitch: true,
                              switchValue:
                                  controller.twoFactorAuthentication.value,
                              onSwitchToggle:
                                  controller.toggleTwoFactorAuthentication,
                            ),
                          ),
                          SettingsItemWidget(
                            icon: _buildIcon(
                              isImage: true,
                              path: IconPath.privacyPolicy,
                            ),
                            title: 'Privacy Policy',
                            onTap: controller.navigateToPrivacyPolicy,
                          ),
                        ],
                      ),

                      SizedBox(height: AppConstants.spacing32),
                    ],
                  ),
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
                size: 16.w,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: Text(
              'Settings',
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

  /// Builds icon widget for settings items
  /// Handles both SVG and PNG images from the downloaded assets
  Widget _buildIcon({required bool isImage, required String path}) {
    if (isImage && path.endsWith('.png')) {
      return Image.asset(
        path,
        width: 20.w,
        height: 20.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to a simple icon if image fails to load
          return Icon(Icons.settings, size: 20.w, color: AppColors.white);
        },
      );
    } else {
      return SvgPicture.asset(
        path,
        width: 20.w,
        height: 20.h,
        colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
      );
    }
  }
}
