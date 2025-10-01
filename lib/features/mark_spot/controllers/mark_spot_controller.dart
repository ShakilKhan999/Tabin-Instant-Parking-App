import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Mark Spot Controller
/// Manages the business logic for marking parking spots
class MarkSpotController extends GetxController {
  final Logger _logger = Logger();
  final ImagePicker _imagePicker = ImagePicker();

  // Observable variables for form state
  final RxString selectedStatus = 'Available'.obs;
  final RxString gpsLocation = '123 Main Street'.obs;
  final RxString notes = ''.obs;
  final RxList<File> attachedImages = <File>[].obs;
  final RxBool isLoading = false.obs;

  // Form validation
  final RxBool statusError = false.obs;
  final RxBool locationError = false.obs;
  final RxBool notesError = false.obs;

  // Text editing controllers
  late TextEditingController notesController;

  // Status options
  final List<String> statusOptions = ['Available', 'Occupied'];

  @override
  void onInit() {
    super.onInit();
    notesController = TextEditingController();
    _logger.d('MarkSpotController initialized');
  }

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }

  /// Updates the selected status
  void updateStatus(String status) {
    selectedStatus.value = status;
    if (statusError.value) {
      statusError.value = false;
    }
    _logger.d('Status updated to: $status');
  }

  /// Updates the GPS location
  void updateLocation(String location) {
    gpsLocation.value = location;
    if (locationError.value) {
      locationError.value = false;
    }
    _logger.d('Location updated to: $location');
  }

  /// Updates notes
  void updateNotes(String value) {
    notes.value = value;
    if (notesError.value && value.isNotEmpty) {
      notesError.value = false;
    }
  }

  /// Shows image picker bottom sheet following support ticket/edit profile pattern
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
                  'Add Photo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF161616),
                  ),
                ),

                SizedBox(height: 8),

                // Subtitle
                Text(
                  'Choose how you want to add your photo',
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
                          _pickImageFromCamera();
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
                          _pickImageFromGallery();
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
            ),
          ],
        ),
      ),
    );
  }

  /// Picks image from camera
  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (image != null) {
        attachedImages.add(File(image.path));
        _logger.d('Image picked from camera: ${image.path}');
      }
    } catch (error) {
      _logger.e('Error picking image from camera: $error');
      EasyLoading.showError('Failed to capture image');
    }
  }

  /// Picks image from gallery
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (image != null) {
        attachedImages.add(File(image.path));
        _logger.d('Image picked from gallery: ${image.path}');
      }
    } catch (error) {
      _logger.e('Error picking image from gallery: $error');
      EasyLoading.showError('Failed to select image');
    }
  }

  /// Removes image at specific index
  void removeImage(int index) {
    if (index >= 0 && index < attachedImages.length) {
      attachedImages.removeAt(index);
      _logger.d('Image removed at index: $index');
    }
  }

  /// Validates the form
  bool validateForm() {
    bool isValid = true;

    // Reset errors
    statusError.value = false;
    locationError.value = false;
    notesError.value = false;

    // Validate status
    if (selectedStatus.value.isEmpty) {
      statusError.value = true;
      isValid = false;
    }

    // Validate location
    if (gpsLocation.value.isEmpty) {
      locationError.value = true;
      isValid = false;
    }

    // Note: Notes are optional, so no validation needed

    if (!isValid) {
      EasyLoading.showError('Please fill in all required fields');
    }

    return isValid;
  }

  /// Submits the mark spot form
  Future<void> submitMarkSpot() async {
    if (!validateForm()) return;

    try {
      isLoading.value = true;
      EasyLoading.show(status: 'Marking spot...');

      _logger.d('Submitting mark spot with data:');
      _logger.d('Status: ${selectedStatus.value}');
      _logger.d('Location: ${gpsLocation.value}');
      _logger.d('Notes: ${notesController.text}');
      _logger.d('Images: ${attachedImages.length}');

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Show success message
      EasyLoading.showSuccess('Spot marked successfully!');

      // Navigate back or show success screen
      Get.back();

      _logger.d('Mark spot submitted successfully');
    } catch (error) {
      _logger.e('Error submitting mark spot: $error');
      EasyLoading.showError('Failed to mark spot');
    } finally {
      isLoading.value = false;
    }
  }

  /// Shows location picker
  void showLocationPicker() {
    // TODO: Implement location picker
    _logger.d('Location picker tapped');
    EasyLoading.showInfo('Location picker coming soon');
  }
}
