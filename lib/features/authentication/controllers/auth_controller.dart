import 'package:ahmedkamal443/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // for login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // for registration
  final fullNameController = TextEditingController();
  final regEmailController = TextEditingController();
  final regPasswordController = TextEditingController();

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;
    debugPrint('Login with email: $email and password: $password');
    Get.toNamed('/bottom-nav');
  }

  void register() {
    // Implement registration logic here
    String fullName = fullNameController.text;
    String email = regEmailController.text;
    String password = regPasswordController.text;
    debugPrint(
      'Register with name: $fullName, email: $email, and password: $password',
    );
  }

  void navigateToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  void navigateToLogin() {
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    regEmailController.dispose();
    regPasswordController.dispose();
    super.onClose();
  }
}
