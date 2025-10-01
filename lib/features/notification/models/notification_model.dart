/// Notification data model
/// Represents a notification item with all required properties
class NotificationModel {
  /// Notification data model for displaying notification items
  /// Contains all properties needed for notification display

  final String id;
  final String title;
  final String subtitle;
  final String time;
  final NotificationType type;
  final bool isHighlighted;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
    this.isHighlighted = false,
    this.isRead = false,
  });

  /// Creates a notification from JSON data
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      time: json['time'] ?? '',
      type: NotificationType.fromString(json['type'] ?? ''),
      isHighlighted: json['isHighlighted'] ?? false,
      isRead: json['isRead'] ?? false,
    );
  }

  /// Converts notification to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'time': time,
      'type': type.name,
      'isHighlighted': isHighlighted,
      'isRead': isRead,
    };
  }

  /// Creates a copy with updated properties
  NotificationModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? time,
    NotificationType? type,
    bool? isHighlighted,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      time: time ?? this.time,
      type: type ?? this.type,
      isHighlighted: isHighlighted ?? this.isHighlighted,
      isRead: isRead ?? this.isRead,
    );
  }
}

/// Notification types enum
/// Defines different types of notifications for proper icon display
enum NotificationType {
  parkingSpot,
  points,
  tip,
  expired,
  general;

  /// Creates notification type from string
  static NotificationType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'parkingspot':
        return NotificationType.parkingSpot;
      case 'points':
        return NotificationType.points;
      case 'tip':
        return NotificationType.tip;
      case 'expired':
        return NotificationType.expired;
      default:
        return NotificationType.general;
    }
  }
}
