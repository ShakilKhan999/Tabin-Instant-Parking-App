import 'package:ahmedkamal443/routes/app_routes.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      image: 'assets/images/welcome_image.png',
      title: 'Welcome to TaBin!',
      subtitle: 'Earn points while helping others find free parking.',
      description: '+30 Points is a welcome gift! 🎁',
      buttonText: 'Get Started',
    ),
    OnboardingData(
      image: 'assets/images/onboarding_1.png',
      title: 'Find Free Parking Instantly',
      subtitle:
          'Join the smart community sharing real-time parking spots. Save time, gas, and stress with Tabin.',
      buttonText: 'Continue',
    ),
    OnboardingData(
      image: 'assets/images/onboarding_2.png',
      title: 'Help Others, Get Rewards',
      subtitle:
          'Report a free spot, earn points. Redeem them for real gifts like Netflix, Amazon, Migros & more.',
      buttonText: 'Continue',
    ),
    OnboardingData(
      image: 'assets/images/onboarding_3.png',
      title: 'Your Route, Your Park',
      subtitle:
          'Get notified when parking is available near your work, home, or favorite places. Let Tabin do the thinking.',
      buttonText: 'Get Started',
    ),
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      currentPage.value++;
    } else {
      // Navigate to main app
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void skipOnboarding() {
    Get.offAllNamed(AppRoutes.login);
  }

  void updatePage(int index) {
    currentPage.value = index;
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;
  final String? description;
  final String buttonText;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
    this.description,
    required this.buttonText,
  });
}
