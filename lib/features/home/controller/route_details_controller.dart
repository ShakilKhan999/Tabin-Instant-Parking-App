import 'package:get/get.dart';

class RouteDetailsController extends GetxController {
  // Route information
  final RxString routeTitle = 'Home to Work'.obs;
  final RxString distance = '6.1Km'.obs;
  final RxString estimatedTime = '30 Mins'.obs;

  // Map markers/points data
  final RxList<MapMarker> mapMarkers = <MapMarker>[].obs;

  // Navigation state
  final RxBool isNavigating = false.obs;
  final RxString currentLocation = 'Current Location'.obs;

  @override
  void onInit() {
    super.onInit();
    // Get route from arguments
    final String? route = Get.arguments as String?;
    if (route != null) {
      routeTitle.value = route;
      _loadRouteData(route);
    }
  }

  void _loadRouteData(String route) {
    // Load specific data based on the selected route
    if (route == 'Home to Work') {
      distance.value = '6.1Km';
      estimatedTime.value = '30 Mins';
      _loadHomeToWorkMarkers();
    } else if (route == 'Work to Home') {
      distance.value = '6.1Km';
      estimatedTime.value = '35 Mins';
      _loadWorkToHomeMarkers();
    }
  }

  void _loadHomeToWorkMarkers() {
    mapMarkers.value = [
      MapMarker(
        id: 'home',
        type: MarkerType.home,
        latitude: 23.7808,
        longitude: 90.2792,
        title: 'Home',
        subtitle: 'Your starting point',
      ),
      MapMarker(
        id: 'work',
        type: MarkerType.work,
        latitude: 23.7906,
        longitude: 90.2906,
        title: 'Office',
        subtitle: 'Your destination',
      ),
      MapMarker(
        id: 'poi1',
        type: MarkerType.pointOfInterest,
        latitude: 23.7850,
        longitude: 90.2820,
        title: 'Cafe',
        subtitle: 'Coffee stop',
      ),
      MapMarker(
        id: 'poi2',
        type: MarkerType.pointOfInterest,
        latitude: 23.7880,
        longitude: 90.2860,
        title: 'Gas Station',
        subtitle: 'Fuel stop',
      ),
    ];
  }

  void _loadWorkToHomeMarkers() {
    mapMarkers.value = [
      MapMarker(
        id: 'work',
        type: MarkerType.work,
        latitude: 23.7906,
        longitude: 90.2906,
        title: 'Office',
        subtitle: 'Your starting point',
      ),
      MapMarker(
        id: 'home',
        type: MarkerType.home,
        latitude: 23.7808,
        longitude: 90.2792,
        title: 'Home',
        subtitle: 'Your destination',
      ),
      MapMarker(
        id: 'poi1',
        type: MarkerType.pointOfInterest,
        latitude: 23.7870,
        longitude: 90.2840,
        title: 'Grocery Store',
        subtitle: 'Shopping stop',
      ),
      MapMarker(
        id: 'poi2',
        type: MarkerType.pointOfInterest,
        latitude: 23.7820,
        longitude: 90.2800,
        title: 'Pharmacy',
        subtitle: 'Medicine stop',
      ),
    ];
  }

  void startNavigation() {
    isNavigating.value = true;
    // Add navigation logic here
    Get.snackbar(
      'Navigation Started',
      'Navigating to ${routeTitle.value}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void stopNavigation() {
    isNavigating.value = false;
  }

  void onMapTap(double latitude, double longitude) {
    // Handle map tap events
    print('Map tapped at: $latitude, $longitude');
  }

  void onMarkerTap(MapMarker marker) {
    // Handle marker tap events
    Get.snackbar(
      marker.title,
      marker.subtitle,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

// Map Marker Model
class MapMarker {
  final String id;
  final MarkerType type;
  final double latitude;
  final double longitude;
  final String title;
  final String subtitle;

  MapMarker({
    required this.id,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.subtitle,
  });
}

enum MarkerType { home, work, pointOfInterest, currentLocation }
