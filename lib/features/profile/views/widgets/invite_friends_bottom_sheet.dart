import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/icon_path.dart';
import 'package:ahmedkamal443/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class InviteFriendsBottomSheet extends StatelessWidget {
  const InviteFriendsBottomSheet({super.key});

  // Referral link
  static const String referralLink = 'https://tabin.app/invite/TBN45XY9';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 636.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        border: Border.all(color: const Color(0xFFDBDBDB), width: 1),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 124.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: const Color(0xFF161616),
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),

          SizedBox(height: 30.h),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration container
                  Container(
                    width: 390.w,
                    height: 216.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F0FF),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20.w, 11.h, 19.w, 20.h),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImagePath.shareIcon,
                          ), // Placeholder for invite illustration
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Title and description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Earn Rewards by Inviting Friends!',
                        style: AppTextStyles.headlineMedium.copyWith(
                          color: AppColors.primary,
                          fontSize: 24.18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Share TaBin with your friends and earn bonus points when they sign up.',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 15.sp,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Referral link section
                  Row(
                    children: [
                      // Link container
                      Expanded(
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              referralLink,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Copy button
                      GestureDetector(
                        onTap: () => _copyToClipboard(),
                        child: Container(
                          width: 52.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Transform.scale(
                            scale: 0.6,
                            child: Image.asset(
                              IconPath.copy,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Social media buttons
                  Row(
                    children: [
                      _buildSocialButton(
                        icon: IconPath.instagram,
                        onTap: () => _shareToInstagram(),
                      ),
                      SizedBox(width: 14.w),
                      _buildSocialButton(
                        icon: IconPath.facebook,
                        onTap: () => _shareToFacebook(),
                      ),
                      SizedBox(width: 14.w),
                      _buildSocialButton(
                        icon: IconPath.whatsapp,
                        onTap: () => _shareToWhatsApp(),
                      ),
                      SizedBox(width: 14.w),
                      _buildSocialButton(
                        icon: IconPath.twitter,
                        onTap: () => _shareToTwitter(),
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h),

                  // Bonus points info
                  Container(
                    width: double.infinity,
                    height: 57.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBE9F7),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        // Icon
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Iconsax.star_1,
                            color: AppColors.white,
                            size: 15.sp,
                          ),
                        ),
                        SizedBox(width: 11.w),
                        // Text
                        Text(
                          'You\'ll earn +50 points for each friend',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.1909,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build social media sharing button
  Widget _buildSocialButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Transform.scale(
          scale: 0.6,
          child: Image.asset(icon, height: 20.h, width: 20.w),
        ),
      ),
    );
  }

  /// Copy referral link to clipboard
  void _copyToClipboard() {
    Clipboard.setData(const ClipboardData(text: referralLink));
    Get.snackbar(
      'Copied!',
      'Referral link copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      margin: EdgeInsets.all(16.w),
      borderRadius: 10.r,
      duration: const Duration(seconds: 2),
    );
  }

  /// Share to Instagram
  void _shareToInstagram() {
    // Implement Instagram sharing
    Get.snackbar(
      'Share to Instagram',
      'Instagram sharing not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      margin: EdgeInsets.all(16.w),
      borderRadius: 10.r,
    );
  }

  /// Share to Facebook
  void _shareToFacebook() {
    // Implement Facebook sharing
    Get.snackbar(
      'Share to Facebook',
      'Facebook sharing not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      margin: EdgeInsets.all(16.w),
      borderRadius: 10.r,
    );
  }

  /// Share to WhatsApp
  void _shareToWhatsApp() {
    // Implement WhatsApp sharing
    Get.snackbar(
      'Share to WhatsApp',
      'WhatsApp sharing not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      margin: EdgeInsets.all(16.w),
      borderRadius: 10.r,
    );
  }

  /// Share to Twitter
  void _shareToTwitter() {
    // Implement Twitter sharing
    Get.snackbar(
      'Share to Twitter',
      'Twitter sharing not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
      margin: EdgeInsets.all(16.w),
      borderRadius: 10.r,
    );
  }

  /// Show invite friends bottom sheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const InviteFriendsBottomSheet(),
    );
  }
}
