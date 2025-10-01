import 'package:ahmedkamal443/features/map/models/parking_spot_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  var showMap = false.obs;
  var selectedFilter = 'Free'.obs; // 'Free' or 'Paid'
  var selectedSpot = Rx<ParkingSpot?>(null);
  var showBottomSheet = false.obs;
  final secarchController = TextEditingController();

  // Dummy parking spots data
  List<ParkingSpot> parkingSpots = [
    ParkingSpot(
      id: '1',
      name: 'Walgreens - Brooklyn, NY',
      address: 'Brooklyn, 589 Prospect Avenue',
      distance: '6.1 Km',
      time: '30 Mins',
      isFree: true,
      isAvailable: true,
      imageUrl: 'assets/images/parking1.jpg',
      updatedTime: '3 min ago',
    ),
    ParkingSpot(
      id: '2',
      name: 'CVS Pharmacy - Brooklyn, NY',
      address: 'Brooklyn, 234 Atlantic Ave',
      distance: '4.2 Km',
      time: '25 Mins',
      isFree: false,
      isAvailable: true,
      imageUrl: 'assets/images/parking2.jpg',
      updatedTime: '5 min ago',
    ),
    ParkingSpot(
      id: '3',
      name: 'Target Parking - Brooklyn, NY',
      address: 'Brooklyn, 445 Albee Square',
      distance: '7.8 Km',
      time: '35 Mins',
      isFree: true,
      isAvailable: false,
      imageUrl: 'assets/images/parking3.jpg',
      updatedTime: '8 min ago',
    ),
    ParkingSpot(
      id: '1',
      name: 'Walgreens - Brooklyn, NY',
      address: 'Brooklyn, 589 Prospect Avenue',
      distance: '6.1 Km',
      time: '30 Mins',
      isFree: true,
      isAvailable: true,
      imageUrl: 'assets/images/parking1.jpg',
      updatedTime: '3 min ago',
    ),
    ParkingSpot(
      id: '2',
      name: 'CVS Pharmacy - Brooklyn, NY',
      address: 'Brooklyn, 234 Atlantic Ave',
      distance: '4.2 Km',
      time: '25 Mins',
      isFree: false,
      isAvailable: true,
      imageUrl: 'assets/images/parking2.jpg',
      updatedTime: '5 min ago',
    ),
    ParkingSpot(
      id: '3',
      name: 'Target Parking - Brooklyn, NY',
      address: 'Brooklyn, 445 Albee Square',
      distance: '7.8 Km',
      time: '35 Mins',
      isFree: true,
      isAvailable: false,
      imageUrl: 'assets/images/parking3.jpg',
      updatedTime: '8 min ago',
    ),
  ];

  void toggleMap() {
    showMap.value = !showMap.value;
  }

  void toggleFilter() {
    selectedFilter.value = selectedFilter.value == 'Free' ? 'Paid' : 'Free';
  }

  void selectParkingSpot(ParkingSpot spot) {
    selectedSpot.value = spot;
    showBottomSheet.value = true;
  }

  void hideBottomSheet() {
    showBottomSheet.value = false;
    selectedSpot.value = null;
  }

  void navigateToSpot() {
    if (selectedSpot.value != null) {
      Get.snackbar(
        'Navigation',
        'Navigating to ${selectedSpot.value!.name}',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void viewDetails() {
    if (selectedSpot.value != null) {
      Get.snackbar(
        'Details',
        'Viewing details for ${selectedSpot.value!.name}',
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
