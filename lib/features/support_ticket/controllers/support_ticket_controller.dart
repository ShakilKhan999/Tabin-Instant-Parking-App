import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

/// Support Ticket Controller
/// Manages state and business logic for support ticket submission
class SupportTicketController extends GetxController {
  final Logger _logger = Logger();

  // Form controllers
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Observable variables
  final RxString selectedCategory = ''.obs;
  final RxList<File> attachedImages = <File>[].obs;
  final RxBool isLoading = false.obs;

  // Error states
  final RxBool subjectError = false.obs;
  final RxBool categoryError = false.obs;
  final RxBool descriptionError = false.obs;

  // Category options
  final List<String> categories = [
    'Technical Issue',
    'Account Problem',
    'Payment Issue',
    'Feature Request',
    'Bug Report',
    'General Inquiry',
    'Other',
  ];

  /// Image picker instance
  final ImagePicker _picker = ImagePicker();

  @override
  void onClose() {
    // Dispose controllers when widget is closed
    subjectController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  /// Picks image from gallery
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final File imageFile = File(image.path);
        attachedImages.add(imageFile);
        _logger.i('Image picked from gallery: ${image.path}');
        EasyLoading.showSuccess('Image added successfully');
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
        final File imageFile = File(image.path);
        attachedImages.add(imageFile);
        _logger.i('Image captured from camera: ${image.path}');
        EasyLoading.showSuccess('Photo captured successfully');
      }
    } catch (error) {
      _logger.e('Error capturing image from camera: $error');
      EasyLoading.showError('Failed to capture photo');
    }
  }

  /// Removes image at specific index
  void removeImage(int index) {
    if (index >= 0 && index < attachedImages.length) {
      attachedImages.removeAt(index);
      _logger.i('Image removed at index: $index');
    }
  }

  /// Validates the form fields
  bool validateForm() {
    bool isValid = true;

    // Reset error states
    subjectError.value = false;
    categoryError.value = false;
    descriptionError.value = false;

    // Validate subject
    if (subjectController.text.trim().isEmpty) {
      subjectError.value = true;
      isValid = false;
    }

    // Validate category
    if (selectedCategory.value.isEmpty) {
      categoryError.value = true;
      isValid = false;
    }

    // Validate description
    if (descriptionController.text.trim().isEmpty) {
      descriptionError.value = true;
      isValid = false;
    }

    if (!isValid) {
      EasyLoading.showError('Please fill in all required fields');
    }

    return isValid;
  }

  /// Submits the support ticket
  Future<void> submitTicket() async {
    try {
      isLoading.value = true;
      EasyLoading.show(status: 'Submitting ticket...');

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Log ticket details
      _logger.i('Support ticket submitted:');
      _logger.i('Subject: ${subjectController.text}');
      _logger.i('Category: ${selectedCategory.value}');
      _logger.i('Description: ${descriptionController.text}');
      _logger.i('Attached images: ${attachedImages.length}');

      // Here you would typically make an API call to submit the ticket
      // Example:
      // final response = await ApiCaller.postData(
      //   endpoint: 'support/tickets',
      //   data: {
      //     'subject': subjectController.text,
      //     'category': selectedCategory.value,
      //     'description': descriptionController.text,
      //     'images': attachedImages,
      //   },
      // );

      EasyLoading.dismiss();
      EasyLoading.showSuccess('Ticket submitted successfully!');

      // Clear form after successful submission
      _clearForm();
    } catch (error) {
      _logger.e('Error submitting support ticket: $error');
      EasyLoading.dismiss();
      EasyLoading.showError('Failed to submit ticket. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  /// Clears the form data
  void _clearForm() {
    subjectController.clear();
    descriptionController.clear();
    selectedCategory.value = '';
    attachedImages.clear();

    // Reset error states
    subjectError.value = false;
    categoryError.value = false;
    descriptionError.value = false;
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
              color: Colors.black.withOpacity(0.1),
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
                  'Select Image Source',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF161616),
                  ),
                ),

                SizedBox(height: 8),

                // Subtitle
                Text(
                  'Choose how you want to add your screenshot',
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
      backgroundColor: Colors.black.withOpacity(0.5),
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
            color: const Color(0xFF7B7DFF).withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7B7DFF).withOpacity(0.1),
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
                color: const Color(0xFF7B7DFF).withOpacity(0.1),
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
}
