import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ahmedkamal443/features/rewards/models/reward_model.dart';
import 'package:ahmedkamal443/core/utils/constants/image_path.dart';

/// Rewards controller
/// Manages rewards-related business logic and state
class RewardsController extends GetxController {
  // User points and rewards data
  final RxInt userPoints = 1050.obs;
  final RxInt pointsToGold = 40.obs;
  final RxDouble progressToGold = 0.7.obs; // 70% progress
  final RxList<RewardModel> availableRewards = <RewardModel>[].obs;
  final RxList<RedemptionModel> userRedemptions = <RedemptionModel>[].obs;

  // Loading state
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeRewards();
    _loadUserRedemptions();
  }

  /// Initialize available rewards with dummy data
  void _initializeRewards() {
    availableRewards.value = [
      const RewardModel(
        id: '1',
        title: 'Starbucks Coffee',
        pointsRequired: 50,
        imagePath: ImagePath.starbucksCoffee,
      ),
      const RewardModel(
        id: '2',
        title: 'Movie Ticket',
        pointsRequired: 100,
        imagePath: ImagePath.movieTicket,
      ),
      const RewardModel(
        id: '3',
        title: 'McDonald\'s Meal',
        pointsRequired: 120,
        imagePath: ImagePath.mcdonaldsMeal,
      ),
      const RewardModel(
        id: '4',
        title: 'Gift Voucher',
        pointsRequired: 200,
        imagePath: ImagePath.giftVoucher,
      ),
    ];
  }

  /// Load user's redemption history with dummy data
  void _loadUserRedemptions() {
    userRedemptions.value = [
      RedemptionModel(
        id: '1',
        rewardId: '1',
        rewardTitle: 'Starbucks Coffee',
        pointsUsed: 50,
        redeemedDate: DateTime.now().subtract(const Duration(days: 2)),
        imagePath: ImagePath.starbucksCoffee,
      ),
      RedemptionModel(
        id: '2',
        rewardId: '2',
        rewardTitle: 'Movie Ticket',
        pointsUsed: 100,
        redeemedDate: DateTime.now().subtract(const Duration(days: 7)),
        imagePath: ImagePath.movieTicket,
      ),
    ];
  }

  /// Show redeem confirmation dialog
  void showRedeemDialog(RewardModel reward) {
    Get.dialog(
      RedeemConfirmationDialog(
        reward: reward,
        userPoints: userPoints.value,
        onConfirm: () => _confirmRedemption(reward),
        onCancel: () => Get.back(),
      ),
      barrierDismissible: true,
    );
  }

  /// Confirm redemption of a reward
  void _confirmRedemption(RewardModel reward) {
    try {
      // Check if user has enough points
      if (userPoints.value < reward.pointsRequired) {
        Get.snackbar(
          'Error',
          'Insufficient points!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Show loading state
      isLoading.value = true;

      // Simulate API call delay
      Future.delayed(const Duration(seconds: 2), () {
        // Deduct points
        userPoints.value -= reward.pointsRequired;

        // Add to redemption history
        final redemption = RedemptionModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          rewardId: reward.id,
          rewardTitle: reward.title,
          pointsUsed: reward.pointsRequired,
          redeemedDate: DateTime.now(),
          imagePath: reward.imagePath,
        );

        userRedemptions.insert(0, redemption);

        // Update progress to gold
        _updateProgressToGold();

        // Close dialog and show success
        Get.back();
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Reward redeemed successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // TODO: Add API call to redeem reward
        _redeemRewardApi(reward);
      });
    } catch (error) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to redeem reward',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // TODO: Add error logging
    }
  }

  /// Update progress towards gold level
  void _updateProgressToGold() {
    // Calculate progress based on current points
    // Assume gold level requires certain points milestones
    final basePointsForGold = 1000;
    final currentLevel = (userPoints.value / basePointsForGold).floor();
    final nextLevelPoints = (currentLevel + 1) * basePointsForGold;
    final pointsInCurrentLevel =
        userPoints.value - (currentLevel * basePointsForGold);

    pointsToGold.value = nextLevelPoints - userPoints.value;
    progressToGold.value = pointsInCurrentLevel / basePointsForGold;
  }

  /// Check if user can redeem a reward
  bool canRedeem(RewardModel reward) {
    return userPoints.value >= reward.pointsRequired;
  }

  /// Get reward item by ID
  RewardModel? getRewardById(String id) {
    try {
      return availableRewards.firstWhere((reward) => reward.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Refresh rewards data
  Future<void> refreshRewards() async {
    try {
      isLoading.value = true;

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Add API call to fetch latest rewards and user points
      _loadUserPointsFromApi();
      _loadRewardsFromApi();
      _loadRedemptionsFromApi();

      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to refresh rewards',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// API call to redeem reward
  Future<void> _redeemRewardApi(RewardModel reward) async {
    try {
      // TODO: Implement API call to redeem reward
      // final response = await ApiCaller.post('/rewards/redeem', {
      //   'rewardId': reward.id,
      //   'pointsUsed': reward.pointsRequired,
      // });

      print(
        'Redeeming reward: ${reward.title} for ${reward.pointsRequired} points',
      );
    } catch (error) {
      print('Error redeeming reward: $error');
    }
  }

  /// API call to load user points
  Future<void> _loadUserPointsFromApi() async {
    try {
      // TODO: Implement API call to get user points
      // final response = await ApiCaller.get('/user/points');
      // userPoints.value = response.data['points'];

      print('Loading user points from API');
    } catch (error) {
      print('Error loading user points: $error');
    }
  }

  /// API call to load available rewards
  Future<void> _loadRewardsFromApi() async {
    try {
      // TODO: Implement API call to get available rewards
      // final response = await ApiCaller.get('/rewards');
      // availableRewards.value = (response.data as List)
      //     .map((json) => RewardModel.fromJson(json))
      //     .toList();

      print('Loading rewards from API');
    } catch (error) {
      print('Error loading rewards: $error');
    }
  }

  /// API call to load user redemptions
  Future<void> _loadRedemptionsFromApi() async {
    try {
      // TODO: Implement API call to get user redemptions
      // final response = await ApiCaller.get('/user/redemptions');
      // userRedemptions.value = (response.data as List)
      //     .map((json) => RedemptionModel.fromJson(json))
      //     .toList();

      print('Loading redemptions from API');
    } catch (error) {
      print('Error loading redemptions: $error');
    }
  }
}

/// Redeem confirmation dialog widget
class RedeemConfirmationDialog extends StatelessWidget {
  /// Redeem confirmation dialog constructor
  /// [reward] - The reward to be redeemed
  /// [userPoints] - Current user points
  /// [onConfirm] - Callback when user confirms redemption
  /// [onCancel] - Callback when user cancels redemption
  const RedeemConfirmationDialog({
    super.key,
    required this.reward,
    required this.userPoints,
    required this.onConfirm,
    required this.onCancel,
  });

  final RewardModel reward;
  final int userPoints;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final remainingPoints = userPoints - reward.pointsRequired;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title and description
            const Text(
              'Confirm Redemption',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF161616),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'You\'re about to redeem:',
              style: TextStyle(fontSize: 16, color: Color(0xFF161616)),
            ),
            const SizedBox(height: 30),

            // Reward details
            Text(
              '${reward.title} — ${reward.pointsRequired} Points',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7E6DFB),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Current balance
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF161616),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Your Balance:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '$userPoints Points',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Remaining points info
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Remaining after redeem: ',
                style: const TextStyle(fontSize: 16, color: Color(0xFF161616)),
                children: [
                  TextSpan(
                    text: '$remainingPoints Points',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7E6DFB),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Action buttons
            Column(
              children: [
                // Confirm button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: remainingPoints >= 0 ? onConfirm : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7E6DFB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Cancel button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF7E6DFB),
                      side: const BorderSide(
                        color: Color(0xFF7E6DFB),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
