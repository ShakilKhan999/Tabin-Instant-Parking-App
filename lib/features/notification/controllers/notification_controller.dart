import 'package:get/get.dart';
import '../models/notification_model.dart';

/// Notification controller managing notification state and data
/// Handles notification loading, filtering, and user interactions
class NotificationController extends GetxController {
  /// Notification controller for managing notification business logic
  /// Handles data fetching, state management, and user interactions

  // Observable lists for notifications
  final RxList<NotificationModel> _allNotifications = <NotificationModel>[].obs;
  final RxList<NotificationModel> _recentNotifications =
      <NotificationModel>[].obs;

  // Loading state
  final RxBool isLoading = false.obs;

  // Getters for reactive access
  List<NotificationModel> get allNotifications => _allNotifications;
  List<NotificationModel> get recentNotifications => _recentNotifications;

  @override
  void onInit() {
    super.onInit();
    _loadNotifications();
  }

  /// Loads notification data
  /// In a real app, this would fetch from API
  void _loadNotifications() {
    try {
      isLoading.value = true;

      // Mock notification data based on Figma design
      final List<NotificationModel> mockNotifications = [
        const NotificationModel(
          id: '1',
          title: 'New Parking Spot Available!',
          subtitle: '+\$5.00 from123 Main Street · 200..',
          time: 'Just now',
          type: NotificationType.parkingSpot,
        ),
        const NotificationModel(
          id: '2',
          title: 'You Earned +10 Points!',
          subtitle: 'For reporting a new spot',
          time: '5 mins ago',
          type: NotificationType.points,
        ),
        const NotificationModel(
          id: '3',
          title: 'You Received a Tip!',
          subtitle: 'You Received a Tip!',
          time: '20 mins ago',
          type: NotificationType.tip,
          isHighlighted: true,
        ),
        const NotificationModel(
          id: '4',
          title: 'Spot Expired',
          subtitle: 'Parking at Park Avenue no longer available',
          time: '30 mins ago',
          type: NotificationType.expired,
        ),
        const NotificationModel(
          id: '5',
          title: 'You Earned +10 Points!',
          subtitle: 'For reporting a new spot',
          time: '5 mins ago',
          type: NotificationType.points,
        ),
        const NotificationModel(
          id: '6',
          title: 'You Earned +10 Points!',
          subtitle: 'For reporting a new spot',
          time: '5 mins ago',
          type: NotificationType.points,
        ),
      ];

      _allNotifications.value = mockNotifications;
      _recentNotifications.value = mockNotifications;
    } catch (error) {
      // Handle error - in real app would show error message
      Get.snackbar('Error', 'Failed to load notifications');
    } finally {
      isLoading.value = false;
    }
  }

  /// Marks a notification as read
  /// Updates the notification's read status
  void markAsRead(String notificationId) {
    final index = _allNotifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      final notification = _allNotifications[index];
      _allNotifications[index] = notification.copyWith(isRead: true);

      // Update recent notifications as well
      final recentIndex = _recentNotifications.indexWhere(
        (n) => n.id == notificationId,
      );
      if (recentIndex != -1) {
        _recentNotifications[recentIndex] = notification.copyWith(isRead: true);
      }
    }
  }

  /// Marks all notifications as read
  void markAllAsRead() {
    _allNotifications.value = _allNotifications
        .map((notification) => notification.copyWith(isRead: true))
        .toList();

    _recentNotifications.value = _recentNotifications
        .map((notification) => notification.copyWith(isRead: true))
        .toList();
  }

  /// Refreshes notification data
  /// Simulates pull-to-refresh functionality
  Future<void> refreshNotifications() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    _loadNotifications();
  }

  /// Handles notification tap
  /// Marks as read and handles navigation if needed
  void onNotificationTapped(NotificationModel notification) {
    markAsRead(notification.id);

    // Handle specific notification actions based on type
    switch (notification.type) {
      case NotificationType.parkingSpot:
        // Navigate to parking spot details
        break;
      case NotificationType.points:
        // Navigate to points/rewards section
        break;
      case NotificationType.tip:
        // Navigate to earnings section
        break;
      case NotificationType.expired:
        // Show expired spot details
        break;
      case NotificationType.general:
        // Default action
        break;
    }
  }

  /// Gets unread notification count
  int get unreadCount {
    return _allNotifications.where((n) => !n.isRead).length;
  }
}
