import 'package:flutter/material.dart';

/// App color constants extracted from Figma design system
/// Main design color palette for consistent theming across the app
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors - Main brand color from Figma
  static const Color primary = Color(0xFF7E6DFB);
  static const Color primaryLight = Color(0xFF9B8DFC);
  static const Color primaryDark = Color(0xFF6A58E8);
  static const Color bottomSheetDividerColor = Color(0xFF8199CC);
  static const Color textFiledColor = Color(0xFF7B7DFF);
  

  // Background Colors - From Figma designs
  static const Color background = Color(0xFFF7F7F7);
  static const Color backgroundLight = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color yellow = Color(0xFFFFD54B);

  // Card and overlay backgrounds
  static const Color cardBackground = Color(
    0x91FFFFFF,
  ); // rgba(255,255,255,0.57)
  static const Color overlayBackground = Color(
    0x00FFFFFF,
  ); // rgba(255,255,255,0)

  // Text Colors - From Figma text styles
  static const Color textPrimary = Color(0xFF161616);
  static const Color textSecondary = Color(0xFF868686);
  static const Color textHint = Color(0xFF9C9C9C);
  static const Color textLight = Color(0xFF565656);
  static const Color text161616 = Color(0xFF161616);
  static const Color text151515 = Color(0xFF151515);

  // Accent Colors - From Figma design elements
  static const Color yellowAccent = Color(0xFFFFF7CC);

  // Border Colors - From Figma component borders
  static const Color border = Color(0x66CBD3FF); // rgba(203,211,255,0.4)
  static const Color borderDark = Color(0xFFCBD5E0);
  static const Color primaryBorder = Color(0xFF7E6DFB);

  // Status Colors
  static const Color success = Color(0xFF48BB78);
  static const Color warning = Color(0xFFED8936);
  static const Color error = Color(0xFFF56565);
  static const Color info = Color(0xFF4299E1);
  static const Color red = Color(0xFFE60609);
  static const Color redOpacity = Color(0xFFFFE4E4);

  // Gradient Colors - Based on Figma gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // button gradient
  static Gradient buttonGradient = LinearGradient(
    colors: [Color.fromARGB(255, 175, 132, 197), Color(0xFF6A5AE0)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Bottom navigation gradient (from Figma bottom fade)
  static const Gradient bottomFadeGradient = LinearGradient(
    colors: [
      Color(0x00FFFFFF),
      Color(0x58FFFFFF),
    ], // from transparent to 34.581% white
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Common Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const Color greySubtitle = Color(0xff797592);
  static const Color green61991A = Color(0xff61991A);
  static const Color statusColor = Color(0xFF609819);
}
