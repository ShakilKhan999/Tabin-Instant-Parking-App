/// Alert model for parking spot notifications
/// Contains all necessary information for smart parking alerts
class AlertModel {
  final String id;
  final String title;
  final String location;
  final String time;
  final String radius;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  /// Alert model constructor
  const AlertModel({
    required this.id,
    required this.title,
    required this.location,
    required this.time,
    required this.radius,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a copy of the alert with updated values
  AlertModel copyWith({
    String? id,
    String? title,
    String? location,
    String? time,
    String? radius,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AlertModel(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      time: time ?? this.time,
      radius: radius ?? this.radius,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Creates an AlertModel from JSON
  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      time: json['time'] ?? '',
      radius: json['radius'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  /// Converts AlertModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'time': time,
      'radius': radius,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'AlertModel(id: $id, title: $title, location: $location, time: $time, radius: $radius, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlertModel &&
        other.id == id &&
        other.title == title &&
        other.location == location &&
        other.time == time &&
        other.radius == radius &&
        other.isActive == isActive &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        location.hashCode ^
        time.hashCode ^
        radius.hashCode ^
        isActive.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
