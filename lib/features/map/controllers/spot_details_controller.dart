import 'dart:async';

import 'package:ahmedkamal443/features/map/models/details_parking_spot_model.dart';
import 'package:ahmedkamal443/features/map/models/gift_model.dart';
import 'package:ahmedkamal443/features/map/models/reporter_model.dart';
import 'package:ahmedkamal443/features/map/views/send_gift_screen.dart';
import 'package:ahmedkamal443/features/map/widgets/fake_spot_dialog.dart';
import 'package:ahmedkamal443/features/map/widgets/gift_sent_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpotDetailsController extends GetxController {
  var userBalance = 50.obs;
  var selectedGift = Rx<Gift?>(null);
  var timeRemaining = ''.obs;
  Timer? _timer;

  final List<Gift> gifts = [
    Gift(id: '1', name: 'Coffee (50 Points)', points: 50, icon: '☕'),
    Gift(id: '2', name: 'Movie Ticket (100 Points)', points: 100, icon: '🎬'),
    Gift(
      id: '3',
      name: "McDonald's Meal (120 Points)",
      points: 120,
      icon: '🍔',
    ),
    Gift(id: '4', name: 'Gift Voucher (120 Points)', points: 120, icon: '🎁'),
    Gift(id: '5', name: 'Coffee (50 Points)', points: 50, icon: '☕'),
    Gift(id: '6', name: 'Movie Ticket (100 Points)', points: 100, icon: '🎬'),
    Gift(
      id: '7',
      name: "McDonald's Meal (120 Points)",
      points: 120,
      icon: '🍔',
    ),
    Gift(id: '8', name: 'Gift Voucher (120 Points)', points: 120, icon: '🎁'),
  ];

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTimeRemaining();
    });
  }

  void updateTimeRemaining() {
    final now = DateTime.now();
    final spot = getSpotDetails();
    final difference = spot.expiryTime.difference(now);

    if (difference.isNegative) {
      timeRemaining.value = 'Expired';
      _timer?.cancel();
    } else {
      final minutes = difference.inMinutes;
      final seconds = difference.inSeconds % 60;
      timeRemaining.value = '${minutes}m ${seconds}s';
    }
  }

  DetailedParkingSpot getSpotDetails() {
    return DetailedParkingSpot(
      id: '1',
      name: 'Im Park Underhill Garage',
      address: 'Washington Park, 123 Main Street Benymin, Manchester',
      distance: '6.1 Km',
      time: '30 Mins',
      isFree: true,
      isAvailable: true,
      updatedTime: '3 min ago',
      imageUrl:
          'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=400',
      reporter: Reporter(
        id: '1',
        name: 'Basse Cooper',
        avatarUrl:
            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
        reportedTime: DateTime.now().subtract(Duration(minutes: 3)),
        location: '123 Main Street',
      ),
      expiryTime: DateTime.now().add(Duration(minutes: 5)),
      status: 'available',
    );
  }

  void showReportDialog() {
    Get.dialog(FakeSpotReportDialog(), barrierDismissible: true);
  }

  void reportSpot() {
    Get.back();
    Get.snackbar(
      'Reported',
      'Thank you for reporting this spot',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void navigateToGiftScreen() {
    Get.to(() => SendGiftScreen());
  }

  void navigateToSpot() {
    Get.back();
    Get.snackbar(
      'Navigation',
      'Opening maps to navigate to this spot',
      snackPosition: SnackPosition.TOP,
    );
  }

  void sendGift(Gift gift) {
    if (userBalance.value >= gift.points) {
      userBalance.value -= gift.points;
      Get.dialog(GiftSentDialog(gift: gift), barrierDismissible: false);
    } else {
      Get.snackbar(
        'Insufficient Balance',
        'You need ${gift.points - userBalance.value} more points',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'available':
        return Colors.green;
      case 'occupied':
        return Colors.red;
      case 'expired':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case 'available':
        return 'Available';
      case 'occupied':
        return 'Occupied';
      case 'expired':
        return 'Expired';
      default:
        return 'Unknown';
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
