import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

/// Edit Profile controller
/// Manages edit profile business logic and state
class EditProfileController extends GetxController {
  // Logger instance
  final Logger _logger = Logger();

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  // Profile image
  final Rx<File?> profileImage = Rx<File?>(null);

  // Form validation errors
  final RxBool nameError = false.obs;
  final RxBool passwordError = false.obs;
  final RxBool emailError = false.obs;
  final RxBool phoneError = false.obs;
  final RxBool companyError = false.obs;

  // Loading state
  final RxBool isLoading = false.obs;

  // Password visibility
  final RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load existing user data
    _loadUserData();
  }

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    companyController.dispose();
    super.onClose();
  }

  /// Load existing user data
  void _loadUserData() {
    // TODO: Load actual user data from API or storage
    // For now, load sample data
    nameController.text = 'Andrew John';
    emailController.text = 'andrew@email.com';
    phoneController.text = '+90 242 809 1696';
    companyController.text = 'Benymin';
    passwordController.text = ''; // Don't show actual password
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Shows image picker bottom sheet
  void showImagePickerBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Title
                Text(
                  'Change Profile Picture',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF161616),
                  ),
                ),

                SizedBox(height: 8),

                // Subtitle
                Text(
                  'Choose how you want to update your profile picture',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF7F7F7F),
                  ),
                ),

                SizedBox(height: 32),

                // Camera and Gallery options in a row
                Row(
                  children: [
                    // Camera option
                    Expanded(
                      child: _buildImageSourceOption(
                        icon: Icons.camera_alt,
                        title: 'Camera',
                        subtitle: 'Take a photo',
                        onTap: () {
                          Get.back();
                          pickImageFromCamera();
                        },
                      ),
                    ),

                    SizedBox(width: 16),

                    // Gallery option
                    Expanded(
                      child: _buildImageSourceOption(
                        icon: Icons.photo_library,
                        title: 'Gallery',
                        subtitle: 'Choose from library',
                        onTap: () {
                          Get.back();
                          pickImageFromGallery();
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Cancel button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7F7F7F),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      isDismissible: true,
      enableDrag: true,
    );
  }

  /// Builds image source option widget
  Widget _buildImageSourceOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF7B7DFF).withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7B7DFF).withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Icon container
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF7B7DFF).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 28, color: const Color(0xFF7B7DFF)),
            ),

            SizedBox(height: 12),

            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF161616),
              ),
            ),

            SizedBox(height: 4),

            // Subtitle
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: const Color(0xFF7F7F7F)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Picks image from gallery
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        profileImage.value = File(image.path);
        _logger.i('Profile image picked from gallery: ${image.path}');
        EasyLoading.showSuccess('Profile picture updated');
      }
    } catch (error) {
      _logger.e('Error picking image from gallery: $error');
      EasyLoading.showError('Failed to pick image');
    }
  }

  /// Picks image from camera
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        profileImage.value = File(image.path);
        _logger.i('Profile image captured from camera: ${image.path}');
        EasyLoading.showSuccess('Profile picture updated');
      }
    } catch (error) {
      _logger.e('Error capturing image from camera: $error');
      EasyLoading.showError('Failed to capture photo');
    }
  }

  /// Validates the form fields
  bool validateForm() {
    bool isValid = true;

    // Reset errors
    nameError.value = false;
    emailError.value = false;
    phoneError.value = false;

    // Validate name
    if (nameController.text.trim().isEmpty) {
      nameError.value = true;
      isValid = false;
    }

    // Validate email
    if (emailController.text.trim().isEmpty ||
        !GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = true;
      isValid = false;
    }

    // Validate phone
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = true;
      isValid = false;
    }

    if (!isValid) {
      EasyLoading.showError('Please fill all required fields correctly');
    }

    return isValid;
  }

  /// Save profile changes
  Future<void> saveChanges() async {
    if (!validateForm()) return;

    try {
      isLoading.value = true;
      EasyLoading.show(status: 'Saving changes...');

      // TODO: Implement API call to save profile changes
      await Future.delayed(Duration(seconds: 2)); // Simulate API call

      EasyLoading.showSuccess('Profile updated successfully');
      Get.back(); // Return to previous screen
    } catch (error) {
      _logger.e('Error saving profile changes: $error');
      EasyLoading.showError('Failed to save changes');
    } finally {
      isLoading.value = false;
    }
  }

  /// Cancel changes and go back
  void cancelChanges() {
    Get.back();
  }
}
