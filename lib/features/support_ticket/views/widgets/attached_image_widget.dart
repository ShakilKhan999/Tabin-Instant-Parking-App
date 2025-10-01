import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants/app_colors.dart';

/// Attached Image Widget
/// Widget to display attached images with remove functionality
class AttachedImageWidget extends StatelessWidget {
  /// Image file to display
  final File imageFile;

  /// Callback when remove button is pressed
  final VoidCallback onRemove;

  /// Attached Image Widget constructor
  const AttachedImageWidget({
    Key? key,
    required this.imageFile,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF7B7DFF), width: 1),
      ),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: Image.file(imageFile, fit: BoxFit.cover),
            ),
          ),

          // Remove button
          Positioned(
            top: 4.h,
            right: 4.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.close, color: AppColors.white, size: 14.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
