import 'package:ahmedkamal443/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:ahmedkamal443/features/bottom_nav/views/widgets/custom_bottom_nav_widget.dart';
import 'package:ahmedkamal443/features/home/views/home_screen.dart';
import 'package:ahmedkamal443/features/profile/views/screens/profile_screen.dart';
import 'package:ahmedkamal443/features/rewards/views/screens/rewards_screen.dart';
import 'package:ahmedkamal443/features/report_spot/views/screens/mark_spot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              _getCurrentPage(controller.currentIndex),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomStackBottomNavBar(
                  currentIndex: controller.currentIndex,
                  onTabSelected: controller.changeTab,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getCurrentPage(int index) {
    switch (index) {
      case 0:
        return _buildHomePage();
      case 1:
        return _buildMapPage();
      case 2:
        return _buildReportSpotPage();
      case 3:
        return _buildRewardPage();
      case 4:
        return _buildProfilePage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return const HomeView();
  }

  Widget _buildMapPage() {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 64.w, color: const Color(0xFF7B4EFF)),
            SizedBox(height: 16.h),
            Text(
              'Map Page',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'View locations on the map',
              style: TextStyle(fontSize: 16.sp, color: const Color(0xFF666666)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportSpotPage() {
    return const MarkSpotScreen();
  }

  Widget _buildRewardPage() {
    return const RewardsScreen();
  }

  Widget _buildProfilePage() {
    return const ProfileScreen();
  }
}
