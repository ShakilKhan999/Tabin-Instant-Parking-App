import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Profile header widget with user photo and name
/// Displays circular profile image and user name as per Figma design
class ProfileHeaderWidget extends StatelessWidget {
  /// Profile header widget constructor
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Profile picture
          Container(
            width: 121.w,
            height: 121.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface,
              image: DecorationImage(
                // Using placeholder user image for now
                image: AssetImage(ImagePath.profile),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: AppConstants.spacing10),

          // User name
          Text(
            'Andrew John',
            style: AppTextStyles.headlineMedium.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
