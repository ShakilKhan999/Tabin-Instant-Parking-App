/// Reward item model
/// Represents a reward that can be redeemed with points
class RewardModel {
  /// Reward model constructor
  /// [id] - Unique identifier for the reward
  /// [title] - Name of the reward
  /// [pointsRequired] - Points needed to redeem this reward
  /// [imagePath] - Path to the reward image
  /// [isRedeemed] - Whether this reward has been redeemed
  /// [redeemedDate] - Date when the reward was redeemed (if applicable)
  const RewardModel({
    required this.id,
    required this.title,
    required this.pointsRequired,
    required this.imagePath,
    this.isRedeemed = false,
    this.redeemedDate,
  });

  final String id;
  final String title;
  final int pointsRequired;
  final String imagePath;
  final bool isRedeemed;
  final DateTime? redeemedDate;

  /// Creates a copy of this reward with updated values
  RewardModel copyWith({
    String? id,
    String? title,
    int? pointsRequired,
    String? imagePath,
    bool? isRedeemed,
    DateTime? redeemedDate,
  }) {
    return RewardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      pointsRequired: pointsRequired ?? this.pointsRequired,
      imagePath: imagePath ?? this.imagePath,
      isRedeemed: isRedeemed ?? this.isRedeemed,
      redeemedDate: redeemedDate ?? this.redeemedDate,
    );
  }

  /// Creates a RewardModel from JSON
  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      pointsRequired: json['pointsRequired'] ?? 0,
      imagePath: json['imagePath'] ?? '',
      isRedeemed: json['isRedeemed'] ?? false,
      redeemedDate: json['redeemedDate'] != null
          ? DateTime.parse(json['redeemedDate'])
          : null,
    );
  }

  /// Converts RewardModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'pointsRequired': pointsRequired,
      'imagePath': imagePath,
      'isRedeemed': isRedeemed,
      'redeemedDate': redeemedDate?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'RewardModel(id: $id, title: $title, pointsRequired: $pointsRequired, isRedeemed: $isRedeemed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RewardModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// User redemption model
/// Represents a reward that has been redeemed by the user
class RedemptionModel {
  /// Redemption model constructor
  /// [id] - Unique identifier for the redemption
  /// [rewardId] - ID of the redeemed reward
  /// [rewardTitle] - Title of the redeemed reward
  /// [pointsUsed] - Points spent on this redemption
  /// [redeemedDate] - When the redemption occurred
  /// [imagePath] - Path to the reward image
  const RedemptionModel({
    required this.id,
    required this.rewardId,
    required this.rewardTitle,
    required this.pointsUsed,
    required this.redeemedDate,
    required this.imagePath,
  });

  final String id;
  final String rewardId;
  final String rewardTitle;
  final int pointsUsed;
  final DateTime redeemedDate;
  final String imagePath;

  /// Creates a copy of this redemption with updated values
  RedemptionModel copyWith({
    String? id,
    String? rewardId,
    String? rewardTitle,
    int? pointsUsed,
    DateTime? redeemedDate,
    String? imagePath,
  }) {
    return RedemptionModel(
      id: id ?? this.id,
      rewardId: rewardId ?? this.rewardId,
      rewardTitle: rewardTitle ?? this.rewardTitle,
      pointsUsed: pointsUsed ?? this.pointsUsed,
      redeemedDate: redeemedDate ?? this.redeemedDate,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  /// Creates a RedemptionModel from JSON
  factory RedemptionModel.fromJson(Map<String, dynamic> json) {
    return RedemptionModel(
      id: json['id'] ?? '',
      rewardId: json['rewardId'] ?? '',
      rewardTitle: json['rewardTitle'] ?? '',
      pointsUsed: json['pointsUsed'] ?? 0,
      redeemedDate: DateTime.parse(json['redeemedDate']),
      imagePath: json['imagePath'] ?? '',
    );
  }

  /// Converts RedemptionModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rewardId': rewardId,
      'rewardTitle': rewardTitle,
      'pointsUsed': pointsUsed,
      'redeemedDate': redeemedDate.toIso8601String(),
      'imagePath': imagePath,
    };
  }

  /// Gets a relative time string for when this was redeemed
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(redeemedDate);

    if (difference.inDays > 7) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  @override
  String toString() {
    return 'RedemptionModel(id: $id, rewardTitle: $rewardTitle, pointsUsed: $pointsUsed, redeemedDate: $redeemedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RedemptionModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
