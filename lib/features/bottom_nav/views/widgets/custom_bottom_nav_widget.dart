import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CustomStackBottomNavBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  const CustomStackBottomNavBar({
    super.key,
    required this.onTabSelected,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Main Navigation Bar
        Container(
          height: 90.h,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Tab
              _buildNavItem(
                index: 0,
                activeIcon: 'assets/icons/home.png',
                inactiveIcon: 'assets/icons/home_inactive.png',
                label: 'Home',
              ),

              // Map Tab
              _buildNavItem(
                index: 1,
                activeIcon: 'assets/icons/routing.png',
                inactiveIcon: 'assets/icons/routing_inactive.png',
                label: 'Map',
              ),

              SizedBox(width: 60.w),

              // Reward Tab
              _buildNavItem(
                index: 3,
                activeIcon: 'assets/icons/reward_active.png',
                inactiveIcon: 'assets/icons/reward.png',
                label: 'Reward',
              ),

              // Profile Tab
              _buildNavItem(
                index: 4,
                activeIcon: 'assets/icons/user.png',
                inactiveIcon: 'assets/icons/user_inactive.png',
                label: 'Profile',
              ),
            ],
          ),
        ),

        // Center Floating Button
        Positioned(
          top: -30.h,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => onTabSelected(2),
                child: Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(-0.53, 1.97),
                      end: Alignment(1.00, 0.50),
                      colors: [Color(0xFFA03ED3), Color(0xFF6A5AE0)],
                    ),
                    shape: const OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: const Color(0xFFA03ED3).withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(Icons.add, size: 28.w, color: Colors.white),
                ),
              ),
              22.verticalSpace,
              Text(
                'Report Spot',
                style: getTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: currentIndex == 2
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required int index,
    required String activeIcon,
    required String inactiveIcon,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Fixed AnimatedSwitcher with unique keys
          SizedBox(
            width: 28.w,
            height: 28.w,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Image.asset(
                isSelected ? activeIcon : inactiveIcon,
                width: 24.w,
                height: 24.w,
                key: Key('${index}_${isSelected ? 'active' : 'inactive'}'),
                color: isSelected ? null : AppColors.textSecondary,
              ),
            ),
          ),
          SizedBox(height: 4.h),

          Text(
            label,
            style: getTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
