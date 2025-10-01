import 'package:ahmedkamal443/features/authentication/presentation/screens/login_screen.dart';
import 'package:ahmedkamal443/features/authentication/presentation/screens/register_screen.dart';
import 'package:ahmedkamal443/features/home/views/route_details_screen.dart';
import 'package:ahmedkamal443/features/home/views/saved_route_screen.dart';
import 'package:ahmedkamal443/features/onboarding/views/onboarding_screen.dart';
import 'package:ahmedkamal443/features/bottom_nav/views/screens/bottom_nav_screen.dart';
import 'package:ahmedkamal443/features/bottom_nav/controllers/bottom_nav_binding.dart';
import 'package:ahmedkamal443/features/support_ticket/views/screens/support_ticket_screen.dart';
import 'package:ahmedkamal443/features/notification/views/screens/notification_screen.dart';
import 'package:ahmedkamal443/features/settings/views/screens/settings_screen.dart';
import 'package:ahmedkamal443/features/settings/views/screens/privacy_policy_screen.dart';
import 'package:ahmedkamal443/features/edit_profile/views/screens/edit_profile_screen.dart';
import 'package:ahmedkamal443/features/rewards/views/screens/rewards_screen.dart';
import 'package:get/get.dart';

/// App routes configuration
/// Contains all route definitions and their bindings
class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String bottomNav = '/bottom-nav';
  static const String home = '/home';

  static const String routeDetails = '/route-details';
  static const String savedRoute = '/saved-route';

  static const String supportTicket = '/support-ticket';
  static const String notification = '/notification';
  static const String settings = '/settings';
  static const String editProfile = '/edit-profile';
  static const String privacyPolicy = '/privacy-policy';
  static const String rewards = '/rewards';

  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(
      name: bottomNav,
      page: () => const BottomNavScreen(),
      binding: BottomNavBinding(),
    ),

    GetPage(
      name: home,
      page: () => const BottomNavScreen(),
      binding: BottomNavBinding(),
    ),

    GetPage(name: routeDetails, page: () => const RouteDetailsScreen()),
    GetPage(name: savedRoute, page: () => const SavedRoutesScreen()),
    // Support ticket route
    GetPage(name: supportTicket, page: () => const SupportTicketScreen()),
    // Notification route
    GetPage(name: notification, page: () => const NotificationScreen()),
    // Settings route
    GetPage(name: settings, page: () => const SettingsScreen()),
    // Edit Profile route
    GetPage(name: editProfile, page: () => const EditProfileScreen()),
    // Privacy Policy route
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    // Rewards route
    GetPage(name: rewards, page: () => const RewardsScreen()),
  ];
}
