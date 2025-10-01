import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/svg_path.dart';
import 'package:ahmedkamal443/features/edit_profile/controllers/edit_profile_controller.dart';

/// Profile image widget with edit button
/// Displays profile picture with edit functionality
class ProfileImageWidget extends StatelessWidget {
  /// Profile image widget constructor
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.find<EditProfileController>();

    return Center(
      child: SizedBox(
        width: 125.5.w,
        height: 121.h,
        child: Stack(
          children: [
            // Profile image container
            Positioned(
              left: 0,
              top: 0,
              child: Obx(
                () => Container(
                  width: 121.w,
                  height: 121.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.surface,
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: controller.profileImage.value != null
                        ? Image.file(
                            controller.profileImage.value!,
                            width: 121.w,
                            height: 121.h,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            SvgPath.profilePlaceholder,
                            width: 121.w,
                            height: 121.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback to icon if image fails to load
                              return Container(
                                width: 121.w,
                                height: 121.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 40.w,
                                  color: AppColors.primary,
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),

            // Edit button
            Positioned(
              right: 0,
              top: 19.h,
              child: GestureDetector(
                onTap: controller.showImagePickerBottomSheet,
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SvgPath.editIcon,
                      width: 18.w,
                      height: 18.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
