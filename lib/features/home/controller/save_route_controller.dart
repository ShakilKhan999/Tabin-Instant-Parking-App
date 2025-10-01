import 'package:ahmedkamal443/features/home/models/save_route_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SavedRoutesController extends GetxController {
  // Observable lists
  final RxList<SavedRoute> savedRoutes = <SavedRoute>[].obs;
  final RxBool isLoading = false.obs;

  // Add new route form controllers
  final TextEditingController routeTitleController = TextEditingController();
  final TextEditingController startLocationController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  // Form validation
  final RxBool isFormValid = false.obs;

  // Bottom sheet state
  final RxBool isBottomSheetOpen = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleRoutes();
    _setupFormValidation();
  }

  @override
  void onClose() {
    routeTitleController.dispose();
    startLocationController.dispose();
    destinationController.dispose();
    super.onClose();
  }

  void _setupFormValidation() {
    // Listen to text changes for form validation
    routeTitleController.addListener(_validateForm);
    startLocationController.addListener(_validateForm);
    destinationController.addListener(_validateForm);
  }

  void _validateForm() {
    isFormValid.value =
        routeTitleController.text.isNotEmpty &&
        startLocationController.text.isNotEmpty &&
        destinationController.text.isNotEmpty;
  }

  void _loadSampleRoutes() {
    savedRoutes.value = [
      SavedRoute(
        id: '1',
        title: 'Home → Work',
        startLocation: 'Home',
        endLocation: 'Work',
        distance: '12 km',
        estimatedTime: '25 mins',
        startLatitude: 23.7808,
        startLongitude: 90.2792,
        endLatitude: 23.7906,
        endLongitude: 90.2906,
        createdAt: DateTime.now(),
        isFavorite: true,
      ),
      SavedRoute(
        id: '2',
        title: 'Work → Home',
        startLocation: 'Work',
        endLocation: 'Home',
        distance: '12 km',
        estimatedTime: '25 mins',
        startLatitude: 23.7906,
        startLongitude: 90.2906,
        endLatitude: 23.7808,
        endLongitude: 90.2792,
        createdAt: DateTime.now(),
      ),
      SavedRoute(
        id: '3',
        title: 'Home → Grocery',
        startLocation: 'Home',
        endLocation: 'Grocery',
        distance: '12 km',
        estimatedTime: '25 mins',
        startLatitude: 23.7808,
        startLongitude: 90.2792,
        endLatitude: 23.7850,
        endLongitude: 90.2850,
        createdAt: DateTime.now(),
      ),
      SavedRoute(
        id: '3',
        title: 'Home → Grocery',
        startLocation: 'Home',
        endLocation: 'Grocery',
        distance: '12 km',
        estimatedTime: '25 mins',
        startLatitude: 23.7808,
        startLongitude: 90.2792,
        endLatitude: 23.7850,
        endLongitude: 90.2850,
        createdAt: DateTime.now(),
      ),
    ];
  }

  void showAddNewRouteBottomSheet() {
    isBottomSheetOpen.value = true;
    _clearForm();
  }

  void _clearForm() {
    routeTitleController.clear();
    startLocationController.clear();
    destinationController.clear();
    isFormValid.value = false;
  }

  void deleteRoute(String routeId) {
    savedRoutes.removeWhere((route) => route.id == routeId);
    Get.snackbar(
      'Deleted',
      'Route deleted successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[100],
      colorText: Colors.red[800],
    );
  }

  void toggleFavorite(String routeId) {
    final index = savedRoutes.indexWhere((route) => route.id == routeId);
    if (index != -1) {
      savedRoutes[index] = savedRoutes[index].copyWith(
        isFavorite: !savedRoutes[index].isFavorite,
      );
    }
  }

  void viewRouteOnMap(SavedRoute route) {
    Get.toNamed('/route-details', arguments: route.title);
  }

  void editRoute(SavedRoute route) {
    routeTitleController.text = route.title;
    startLocationController.text = route.startLocation;
    destinationController.text = route.endLocation;
    showAddNewRouteBottomSheet();
  }

  void saveNewRoute() {
    if (!isFormValid.value) return;

    final newRoute = SavedRoute(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: '${startLocationController.text} → ${destinationController.text}',
      startLocation: startLocationController.text,
      endLocation: destinationController.text,
      distance: '12 km', // This would come from map calculation
      estimatedTime: '25 mins', // This would come from map calculation
      startLatitude: 23.7808, // This would come from geocoding
      startLongitude: 90.2792, // This would come from geocoding
      endLatitude: 23.7906, // This would come from geocoding
      endLongitude: 90.2906, // This would come from geocoding
      createdAt: DateTime.now(),
    );

    savedRoutes.add(newRoute);
    Get.back();

    Get.snackbar(
      'Success',
      'Route saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green[100],
      colorText: Colors.green[800],
    );
  }
}
