import 'package:get/get.dart';
import '../models/alert_model.dart';

/// Controller for managing smart alerts functionality
/// Handles CRUD operations for parking alerts
class AlertsController extends GetxController {
  // Observable list of alerts
  final RxList<AlertModel> _alerts = <AlertModel>[].obs;

  // Loading state
  final RxBool _isLoading = false.obs;

  /// Getter for alerts list
  List<AlertModel> get alerts => _alerts;

  /// Getter for loading state
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _loadSampleAlerts();
  }

  /// Loads sample alerts data
  void _loadSampleAlerts() {
    _alerts.assignAll([
      AlertModel(
        id: '1',
        title: 'Park Avenue',
        location: 'Kağıthane',
        time: '08:40 AM',
        radius: '1 km',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      AlertModel(
        id: '2',
        title: 'Park Avenue',
        location: 'Kağıthane',
        time: '08:40 AM',
        radius: '1 km',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      AlertModel(
        id: '3',
        title: 'Park Avenue',
        location: 'Kağıthane',
        time: '08:40 AM',
        radius: '1 km',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ]);
  }

  /// Adds a new alert
  Future<void> addAlert(AlertModel alert) async {
    try {
      _isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      _alerts.insert(0, alert);

      Get.snackbar(
        'Success',
        'Alert added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add alert: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  /// Updates an existing alert
  Future<void> updateAlert(AlertModel updatedAlert) async {
    try {
      _isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      final index = _alerts.indexWhere((alert) => alert.id == updatedAlert.id);
      if (index != -1) {
        _alerts[index] = updatedAlert;

        Get.snackbar(
          'Success',
          'Alert updated successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update alert: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  /// Deletes an alert
  Future<void> deleteAlert(String alertId) async {
    try {
      _isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      _alerts.removeWhere((alert) => alert.id == alertId);

      Get.snackbar(
        'Success',
        'Alert deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete alert: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  /// Toggles alert active status
  Future<void> toggleAlertStatus(String alertId) async {
    try {
      final index = _alerts.indexWhere((alert) => alert.id == alertId);
      if (index != -1) {
        final updatedAlert = _alerts[index].copyWith(
          isActive: !_alerts[index].isActive,
        );
        await updateAlert(updatedAlert);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to toggle alert status: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
