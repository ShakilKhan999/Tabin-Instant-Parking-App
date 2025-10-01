import 'package:ahmedkamal443/routes/app_routes.dart';
import 'package:get/get.dart';

enum MapFilter { free, paid }

class HomeController extends GetxController {
  var selectedMapFilter = MapFilter.free.obs;

  // User-related dynamic data
  final RxString userName = 'Andrew'.obs;
  final RxString userProfileImage =
      'https://i.pinimg.com/736x/59/31/91/593191e830f98ea51d4514f1ce76de88.jpg'
          .obs;
  final RxString badge = 'Silver Badge'.obs;
  final RxInt points = 1050.obs;
  final RxString selectedRoute = ''.obs;

  void selectMapFilter(MapFilter filter) {
    selectedMapFilter.value = filter;
  }

  void selectRoute(String route) {
    if (selectedRoute.value == route) {
      selectedRoute.value = '';
    } else {
      selectedRoute.value = route;
      // Navigate to route details screen
      _navigateToRouteDetails(route);
    }
  }

  void _navigateToRouteDetails(String route) {
    // Navigate to route details screen with the selected route as argument
    Get.toNamed(AppRoutes.routeDetails, arguments: route);
  }

  // Method to handle route button tap directly
  void onRouteButtonTap(String route) {
    selectRoute(route);
  }
}
