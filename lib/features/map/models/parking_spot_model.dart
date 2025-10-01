class ParkingSpot {
  final String id;
  final String name;
  final String address;
  final String distance;
  final String time;
  final bool isFree;
  final bool isAvailable;
  final String imageUrl;
  final String updatedTime;

  ParkingSpot({
    required this.id,
    required this.name,
    required this.address,
    required this.distance,
    required this.time,
    required this.isFree,
    required this.isAvailable,
    required this.imageUrl,
    required this.updatedTime,
  });
}
