import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

/// Bottom navigation binding
/// Handles dependency injection for bottom navigation feature
class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize bottom navigation controller
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
      fenix: true, // Keeps the controller alive even when not in use
    );
  }
}
