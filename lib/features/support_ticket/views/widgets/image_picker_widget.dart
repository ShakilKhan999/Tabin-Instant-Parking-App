import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:ahmedkamal443/core/utils/constants/app_text_styles.dart';
import 'package:ahmedkamal443/features/support_ticket/controllers/support_ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Image Picker Widget
/// Widget for picking images from camera or gallery
class ImagePickerWidget extends StatelessWidget {
  /// Image Picker Widget constructor
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SupportTicketController controller =
        Get.find<SupportTicketController>();

    return GestureDetector(
      onTap: () => controller.showImagePickerBottomSheet(),
      child: Container(
        width: double.infinity,
        height: 129.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(13.674.r),
          // border: Border.all(color: const Color(0xFF7B7DFF), width: 1.14),
        ),
        child: CustomPaint(
          painter: DashedBorderPainter(
            color: const Color(0xFF7B7DFF),
            strokeWidth: 1.14,
            dashWidth: 8.0,
            dashSpace: 4.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upload icon
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

              // Upload text
              Text(
                'Add a Screenshot',
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
