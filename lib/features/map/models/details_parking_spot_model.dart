import 'package:ahmedkamal443/features/map/models/parking_spot_model.dart';
import 'package:ahmedkamal443/features/map/models/reporter_model.dart';

class DetailedParkingSpot extends ParkingSpot {
  final String imageUrl;
  final Reporter reporter;
  final DateTime expiryTime;
  final String status; // 'available', 'occupied', 'expired'

  DetailedParkingSpot({
    required super.id,
    required super.name,
    required super.address,
    required super.distance,
    required super.time,
    required super.isFree,
    required super.isAvailable,
    required super.updatedTime,
    required this.imageUrl,
    required this.reporter,
    required this.expiryTime,
    required this.status,
  }) : super(imageUrl: '');
}
