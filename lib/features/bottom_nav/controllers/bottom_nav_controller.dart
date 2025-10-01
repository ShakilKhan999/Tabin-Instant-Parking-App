import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

/// Bottom navigation controller
/// Manages the state and navigation logic for bottom navigation bar
class BottomNavController extends GetxController {
  static BottomNavController get instance => Get.find();

  final Logger _logger = Logger();

  // Persistent tab controller
  late PersistentTabController tabController;

  // Current selected index (observable)
  final RxInt _currentIndex = 0.obs;

  /// Gets the current selected tab index
  int get currentIndex => _currentIndex.value;

  /// Changes the selected tab
  /// [index] - The index of the tab to select (0-4)
  void changeTab(int index) {
    try {
      // Validate index range
      if (index < 0 || index > 4) {
        _logger.w('Invalid tab index: $index. Must be between 0-4');
        return;
      }

      // Only update if index is different to prevent loops
      if (_currentIndex.value != index) {
        _currentIndex.value = index;

        // Update persistent tab controller if initialized and different
        if (tabController.index != index) {
          tabController.jumpToTab(index);
        }

        update(); // Trigger GetBuilder rebuild
        _logger.d('Tab changed to index: $index (${currentTabName})');
      }
    } catch (error) {
      _logger.e('Error changing tab: $error');
    }
  }

  /// Handles center button (Report Spot) tap
  void onCenterButtonTapped() {
    try {
      _logger.d('Center button (Report Spot) tapped');

      // Navigate to center tab (Report Spot - index 2)
      changeTab(2);
    } catch (error) {
      _logger.e('Error handling center button tap: $error');
    }
  }

  /// Gets the current tab name for debugging
  String get currentTabName {
    switch (currentIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Map';
      case 2:
        return 'Report Spot';
      case 3:
        return 'Reward';
      case 4:
        return 'Profile';
      default:
        return 'Unknown';
    }
  }

  /// Navigate to specific tab by name
  void navigateToTab(String tabName) {
    switch (tabName.toLowerCase()) {
      case 'home':
        changeTab(0);
        break;
      case 'map':
        changeTab(1);
        break;
      case 'report':
      case 'report spot':
        changeTab(2);
        break;
      case 'reward':
      case 'rewards':
        changeTab(3);
        break;
      case 'profile':
        changeTab(4);
        break;
      default:
        _logger.w('Unknown tab name: $tabName');
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize persistent tab controller
    tabController = PersistentTabController(initialIndex: 0);
    _logger.d(
      'BottomNavController initialized with initial index: ${_currentIndex.value}',
    );
  }

  @override
  void onClose() {
    _logger.d('BottomNavController disposed');
    super.onClose();
  }
}
