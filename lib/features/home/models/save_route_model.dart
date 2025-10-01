class SavedRoute {
  final String id;
  final String title;
  final String startLocation;
  final String endLocation;
  final String distance;
  final String estimatedTime;
  final double startLatitude;
  final double startLongitude;
  final double endLatitude;
  final double endLongitude;
  final DateTime createdAt;
  final bool isFavorite;
  String get displayTitle => '$startLocation → $endLocation';
  SavedRoute({
    required this.id,
    required this.title,
    required this.startLocation,
    required this.endLocation,
    required this.distance,
    required this.estimatedTime,
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
    required this.endLongitude,
    required this.createdAt,
    this.isFavorite = false,
  });

  SavedRoute copyWith({
    String? id,
    String? title,
    String? startLocation,
    String? endLocation,
    String? distance,
    String? estimatedTime,
    double? startLatitude,
    double? startLongitude,
    double? endLatitude,
    double? endLongitude,
    DateTime? createdAt,
    bool? isFavorite,
  }) {
    return SavedRoute(
      id: id ?? this.id,
      title: title ?? this.title,
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      distance: distance ?? this.distance,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      startLatitude: startLatitude ?? this.startLatitude,
      startLongitude: startLongitude ?? this.startLongitude,
      endLatitude: endLatitude ?? this.endLatitude,
      endLongitude: endLongitude ?? this.endLongitude,
      createdAt: createdAt ?? this.createdAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startLocation': startLocation,
      'endLocation': endLocation,
      'distance': distance,
      'estimatedTime': estimatedTime,
      'startLatitude': startLatitude,
      'startLongitude': startLongitude,
      'endLatitude': endLatitude,
      'endLongitude': endLongitude,
      'createdAt': createdAt.toIso8601String(),
      'isFavorite': isFavorite,
    };
  }

  factory SavedRoute.fromJson(Map<String, dynamic> json) {
    return SavedRoute(
      id: json['id'],
      title: json['title'],
      startLocation: json['startLocation'],
      endLocation: json['endLocation'],
      distance: json['distance'],
      estimatedTime: json['estimatedTime'],
      startLatitude: json['startLatitude'].toDouble(),
      startLongitude: json['startLongitude'].toDouble(),
      endLatitude: json['endLatitude'].toDouble(),
      endLongitude: json['endLongitude'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
