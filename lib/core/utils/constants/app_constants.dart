import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App constants extracted from Figma design system
/// Contains spacing, sizing, and other design measurements for consistent UI
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App information
  static const String appName = 'Teabin App';
  static const String appVersion = '1.0.0';

  // API constants
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Spacing Constants - From Figma design measurements
  static double get spacing2 => 2.0.w;
  static double get spacing4 => 4.0.w;
  static double get spacing5 => 5.0.w; // From Figma gap measurements
  static double get spacing8 => 8.0.w;
  static double get spacing10 => 10.0.w; // From Figma padding/gaps
  static double get spacing12 => 12.0.w;
  static double get spacing15 => 15.0.w;
  static double get spacing16 => 16.0.w;
  static double get spacing20 => 20.0.w; // From Figma spacing
  static double get spacing24 => 24.0.w;
  static double get spacing32 => 32.0.w;

  // Padding Constants - Based on Figma component padding
  static double get paddingSmall => 8.0.w;
  static double get paddingMedium => 16.0.w;
  static double get paddingLarge => 20.0.w; // From Figma screen padding
  static double get paddingXLarge => 24.0.w;

  // Default padding for compatibility
  static double get defaultPadding => paddingMedium;
  static double get smallPadding => paddingSmall;
  static double get largePadding => paddingLarge;
  static double get extraLargePadding => 32.0.w;

  // Border Radius Constants - From Figma design system
  static double get borderRadiusSmall => 8.0.r;
  static double get borderRadiusMedium =>
      10.0.r; // From Figma list items/images
  static double get borderRadiusLarge => 15.0.r; // From Figma search bar
  static double get borderRadiusXLarge => 20.0.r; // From Figma cards
  static double get borderRadiusRound => 35.0.r; // From Figma screen corners
  static double get borderRadiusCircular =>
      45.0.r; // From Figma search container

  // Default border radius for compatibility
  static double get defaultBorderRadius => borderRadiusMedium;

  // Icon Sizes - Based on Figma icon measurements
  static double get iconSizeSmall => 16.0.w;
  static double get iconSizeMedium => 18.0.w; // From Figma search icon
  static double get iconSizeLarge => 20.0.w; // From Figma routing icon
  static double get iconSizeXLarge => 24.0.w;

  // Button Heights - From Figma button components
  static double get buttonHeightSmall => 36.0.h;
  static double get buttonHeightMedium => 43.0.h; // From Figma routing button
  static double get buttonHeightLarge => 50.0.h; // From Figma search bar height
  static double get buttonHeightXLarge => 56.0.h;

  // Bottom Navigation Constants - Updated with Figma measurements
  static double get bottomNavHeight => 85.0.h;
  static double get bottomNavIconSize => 24.0.w;
  static double get bottomNavPadding => 12.0.w;
  static double get bottomNavBorderRadius => 35.0.r;
  static const double bottomNavElevation = 8.0;
  static const double bottomNavFontSize = 12.0;
  static const double centerButtonSize = 56.0;
  static const int bottomNavAnimationDuration = 300;

  // Card Constants - From Figma list item cards
  static double get cardPadding => 10.0.w; // From Figma card padding
  static double get cardRadius => 20.0.r; // From Figma card border radius
  static double get cardElevation => 2.0;
  static double get cardImageSize => 38.93.w; // From Figma list item image

  // Status Bar Constants - From Figma status bar design
  static double get statusBarHeight => 42.0.h; // From Figma status bar
  static double get statusBarPadding => 11.08.w; // From Figma left padding

  // Search Bar Constants - From Figma search component
  static double get searchBarHeight => 50.0.h; // From Figma search bar
  static double get searchBarWidth => 279.0.w; // From Figma search bar width
  static double get searchBarRadius => 15.0.r; // From Figma search bar radius
  static double get searchBarPadding => 16.0.w;

  // List Item Constants - From Figma list design
  static double get listItemHeight =>
      62.0.h; // Calculated from Figma list items
  static double get listItemPadding => 10.0.w; // From Figma list item padding
  static double get listItemSpacing => 20.0.h; // From Figma gap between items
  static double get listItemImageRadius => 10.0.r; // From Figma image radius

  // Typography Constants - Font size references
  static double get fontSizeDisplay => 50.0.sp; // From Figma large text
  static double get fontSizeHeadline => 22.0.sp; // From Figma section titles
  static double get fontSizeTitle =>
      18.0.sp; // From Figma "Nearby Parking Spots"
  static double get fontSizeBody => 15.0.sp; // From Figma list item titles
  static double get fontSizeCaption =>
      12.0.sp; // From Figma list item descriptions
  static double get fontSizeSmall => 10.0.sp; // Navigation labels

  // Animation Constants
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // Animation durations for compatibility
  static const int shortAnimationDuration = 200;
  static const int mediumAnimationDuration = 300;
  static const int longAnimationDuration = 500;

  // Screen Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Network Constants
  static const int requestTimeoutSeconds = 30;
  static const int retryAttempts = 3;

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';

  // Validation Constants
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int maxNameLength = 50;

  // List Constants
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Image Constants
  static const double maxImageSizeMB = 5.0;
  static const int imageQuality = 85;

  // Opacity Constants - From Figma design
  static const double opacityDisabled = 0.5;
  static const double opacityPressed = 0.7;
  static const double opacityCardBackground =
      0.57; // From Figma card background
  static const double opacityBorder = 0.4; // From Figma border opacity

  // Border Width Constants
  static double get borderWidthThin => 0.5.w;
  static double get borderWidthNormal => 1.0.w;
  static double get borderWidthThick => 2.0.w;

  // Shadow Constants
  static const double shadowElevationLow = 2.0;
  static const double shadowElevationMedium = 4.0;
  static const double shadowElevationHigh = 8.0;

  // Grid Constants
  static const int gridCrossAxisCount = 2;
  static double get gridSpacing => 16.0.w;
  static double get gridChildAspectRatio => 0.8;
}
