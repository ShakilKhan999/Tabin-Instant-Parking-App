import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_constants.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/rewards/controllers/rewards_controller.dart';
import 'package:ahmedkamal443/features/rewards/views/widgets/rewards_header_widget.dart';
import 'package:ahmedkamal443/features/rewards/views/widgets/reward_item_widget.dart';
import 'package:ahmedkamal443/features/rewards/views/widgets/redemption_item_widget.dart';

/// Rewards screen widget
/// Displays user points, available rewards, and redemption history
class RewardsScreen extends StatelessWidget {
  /// Rewards screen constructor
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final RewardsController controller = Get.put(RewardsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        onRefresh: controller.refreshRewards,
        color: AppColors.primary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // Rewards header with points
              Obx(
                () => RewardsHeaderWidget(
                  userPoints: controller.userPoints.value,
                  pointsToGold: controller.pointsToGold.value,
                  progressToGold: controller.progressToGold.value,
                ),
              ),

              SizedBox(height: 24.h),

              // Content area
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingLarge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Redeem Options section
                    _buildSectionHeader('Redeem Options'),

                    SizedBox(height: AppConstants.spacing16),

                    // Available rewards list
                    Obx(
                      () => Column(
                        children: controller.availableRewards
                            .map(
                              (reward) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: AppConstants.spacing16,
                                ),
                                child: RewardItemWidget(
                                  reward: reward,
                                  canRedeem: controller.canRedeem(reward),
                                  onRedeem: () =>
                                      controller.showRedeemDialog(reward),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),

                    SizedBox(height: AppConstants.spacing32),

                    // Your Redemptions section
                    _buildSectionHeader('Your Redemptions'),

                    SizedBox(height: AppConstants.spacing16),

                    // Redemption history
                    Obx(
                      () => controller.userRedemptions.isEmpty
                          ? _buildEmptyRedemptions()
                          : Column(
                              children: controller.userRedemptions
                                  .map(
                                    (redemption) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom: AppConstants.spacing16,
                                      ),
                                      child: RedemptionItemWidget(
                                        redemption: redemption,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                    ),

                    // Bottom padding for navigation bar
                    SizedBox(height: 120.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds section header widget
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.titleMedium.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  /// Builds empty redemptions state
  Widget _buildEmptyRedemptions() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        children: [
          Icon(
            Icons.card_giftcard_outlined,
            size: 48.w,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16.h),
          Text(
            'No Redemptions Yet',
            style: AppTextStyles.titleSmall.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Start redeeming rewards to see them here',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
