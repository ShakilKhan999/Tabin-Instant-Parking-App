import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// App text styles extracted from Figma design system
/// Contains typography constants for consistent text styling across the app
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Base font families from Figma designs
  static String get instrumentSans => 'Instrument Sans';
  static String get urbanist => 'Urbanist';
  static String get outfit => 'Outfit';

  // Display Text Styles - Large headings (50px from Figma)
  static TextStyle get displayLarge => GoogleFonts.instrumentSans(
    fontSize: 50.sp,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static TextStyle get displayMedium => GoogleFonts.instrumentSans(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Headline Text Styles - Section titles (22px from Figma)
  static TextStyle get headlineLarge => GoogleFonts.instrumentSans(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle get headlineMedium => GoogleFonts.instrumentSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600, // SemiBold (from "Nearby Parking Spots")
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle get headlineSmall => GoogleFonts.urbanist(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Title Text Styles - Card titles (15px from Figma)
  static TextStyle get titleLarge => GoogleFonts.urbanist(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600, // SemiBold (from list items)
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: -0.15, // From Figma tracking
  );

  static TextStyle get titleMedium => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle get titleSmall => GoogleFonts.urbanist(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // Body Text Styles - Regular content (14px from Figma)
  static TextStyle get bodyLarge => GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Regular (from search placeholder)
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle get bodyMedium => GoogleFonts.urbanist(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400, // Regular (from list item descriptions)
    color: AppColors.textSecondary,
    height: 1.5,
    letterSpacing: -0.144, // From Figma tracking
  );

  static TextStyle get bodySmall => GoogleFonts.urbanist(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Label Text Styles - Buttons and small text
  static TextStyle get labelLarge => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle get labelMedium => GoogleFonts.urbanist(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle get labelSmall => GoogleFonts.urbanist(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Special Text Styles - Based on specific Figma components

  // Status bar time style (14.42px from Figma)
  static TextStyle get statusBarTime => TextStyle(
    fontFamily: 'SF Pro Text', // System font
    fontSize: 14.42.sp,
    fontWeight: FontWeight.w600, // Semibold
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -0.4808,
  );

  // Search placeholder style (14px Outfit from Figma)
  static TextStyle get searchPlaceholder => GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textHint,
    height: 1.0,
  );

  // Button text styles
  static TextStyle get buttonLarge => GoogleFonts.urbanist(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
  );

  static TextStyle get buttonMedium => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.3,
  );

  static TextStyle get buttonSmall => GoogleFonts.urbanist(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.3,
  );

  // Bottom navigation specific styles - Updated with new colors
  static TextStyle get bottomNavLabel => GoogleFonts.urbanist(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  static TextStyle get bottomNavLabelActive => GoogleFonts.urbanist(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.2,
  );

  static TextStyle get bottomNavLabelInactive => GoogleFonts.urbanist(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  // Navigation text styles (for compatibility)
  static TextStyle get navLabel => bottomNavLabel;
  static TextStyle get navLabelActive => bottomNavLabelActive;

  // Button text for compatibility
  static TextStyle get buttonText => buttonLarge;
  static TextStyle get buttonTextSmall => buttonSmall;

  // Helper methods for color variations
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size.sp);
  }
}
