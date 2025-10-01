import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/report_spot/controllers/mark_spot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Photo Picker Widget
/// Dashed border widget for adding photos following support ticket screen pattern
class PhotoPickerWidget extends StatelessWidget {
  /// Photo Picker Widget constructor
  const PhotoPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MarkSpotController controller = Get.find<MarkSpotController>();

    return Column(
      children: [
        // Show attached images if any
        Obx(
          () => controller.attachedImages.isNotEmpty
              ? _buildAttachedImagesList(controller)
              : const SizedBox.shrink(),
        ),

        // Photo picker area - using same design as support ticket screen
        GestureDetector(
          onTap: () => controller.showImagePickerBottomSheet(),
          child: Container(
            width: double.infinity,
            height: 129.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFCFCFC),
              borderRadius: BorderRadius.circular(13.674.r),
            ),
            child: CustomPaint(
              painter: DashedBorderPainter(
                color: const Color(0xFF0266FF).withValues(alpha: 0.51),
                strokeWidth: 1.5,
                dashWidth: 8.0,
                dashSpace: 4.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Upload icon container
                  Container(
                    width: 54.w,
                    height: 54.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B7DFF).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.cloud_upload_outlined,
                      color: const Color(0xFF7B7DFF),
                      size: 24.w,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Add photo text
                  Text(
                    'Add a Photo',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds list of attached images using support ticket screen pattern
  Widget _buildAttachedImagesList(MarkSpotController controller) {
    return Column(
      children: [
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: controller.attachedImages.asMap().entries.map((entry) {
            final index = entry.key;
            final image = entry.value;
            return _buildAttachedImageItem(image, index, controller);
          }).toList(),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  /// Builds individual attached image item following support ticket pattern
  Widget _buildAttachedImageItem(
    dynamic image,
    int index,
    MarkSpotController controller,
  ) {
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
              child: Image.file(image, fit: BoxFit.cover),
            ),
          ),

          // Remove button
          Positioned(
            top: 4.h,
            right: 4.w,
            child: GestureDetector(
              onTap: () => controller.removeImage(index),
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

/// Custom painter for dashed border
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    _drawDashedRect(canvas, size, paint);
  }

  void _drawDashedRect(Canvas canvas, Size size, Paint paint) {
    final radius = 13.674.r;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // Create path from rounded rectangle
    final path = Path()..addRRect(rrect);

    // Draw dashed path
    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final nextDistance = distance + dashWidth;
        final extractPath = pathMetric.extractPath(
          distance,
          nextDistance > pathMetric.length ? pathMetric.length : nextDistance,
        );
        canvas.drawPath(extractPath, paint);
        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
