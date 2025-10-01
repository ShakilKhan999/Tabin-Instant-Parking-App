import 'package:ahmedkamal443/features/home/controller/home_controller.dart';
import 'package:ahmedkamal443/features/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
