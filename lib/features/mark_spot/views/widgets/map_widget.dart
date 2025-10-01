import 'package:ahmedkamal443/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Map Widget
/// Displays a map view with location marker
class MapWidget extends StatelessWidget {
  /// Map Widget constructor
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 209.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFFCCD7FF).withValues(alpha: 0.6),
          width: 1.057,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            // Background image placeholder (you can replace with actual map)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: _buildMapContent(),
            ),

            // Location markers
            _buildLocationMarkers(),
          ],
        ),
      ),
    );
  }

  /// Builds the map content (placeholder)
  Widget _buildMapContent() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFFE8E8E8), const Color(0xFFF5F5F5)],
        ),
      ),
      child: CustomPaint(painter: MapGridPainter()),
    );
  }

  /// Builds location markers on the map
  Widget _buildLocationMarkers() {
    return Stack(
      children: [
        // Main location marker (center)
        Positioned(
          left: 0.47 * 390.w, // Approximate center position
          top: 0.42 * 209.h,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: const Color(0xFF7E6DFB).withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF7E6DFB),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2),
                ),
              ),
            ),
          ),
        ),

        // Additional marker (bottom right)
        Positioned(
          right: 0.04 * 390.w,
          bottom: 0.08 * 209.h,
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0).withValues(alpha: 0.8),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.navigation,
                color: AppColors.textPrimary,
                size: 24.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom painter for map grid background
class MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFDDDDDD).withValues(alpha: 0.3)
      ..strokeWidth = 1.0;

    // Draw vertical lines
    for (int i = 0; i <= 10; i++) {
      final x = (size.width / 10) * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (int i = 0; i <= 6; i++) {
      final y = (size.height / 6) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw some street-like patterns
    final streetPaint = Paint()
      ..color = const Color(0xFFCCCCCC).withValues(alpha: 0.5)
      ..strokeWidth = 2.0;

    // Horizontal streets
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.3),
      streetPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.7),
      Offset(size.width, size.height * 0.7),
      streetPaint,
    );

    // Vertical streets
    canvas.drawLine(
      Offset(size.width * 0.25, 0),
      Offset(size.width * 0.25, size.height),
      streetPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.75, 0),
      Offset(size.width * 0.75, size.height),
      streetPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
