import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static const Color primary = Color(0xFF125A36);  // Main green - keeping your original
  static const Color primaryDark = Color(0xFF0B3E25); // Darker shade for depth
  static const Color primaryLight = Color(0xFF1A7E4C); // Lighter shade for variety

  static const Color secondary = Color(0xFF99CD32); // Keeping your lime green
  static const Color secondaryDark = Color(0xFF7AAA22); // Darker secondary
  static const Color secondaryLight = Color(0xFFB3DA5E); // Lighter secondary

  static const Color tertiary = Color(0xFF2D6CDF); // Complementary blue
  static const Color tertiaryLight = Color(0xFF5B8CE5); // Lighter tertiary
  static const Color accent = Color(0xFFb0c7ff); // Keeping your accent

  // Text colors
  static const Color textPrimary = Color(0xFF0F0F0F); // Near black for primary text
  static const Color textSecondary = Color(0xFF5F6368); // Dark gray for secondary text
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF5F5F5); // Light mode background
  static const Color dark = Color(0xFF272727); // Dark mode background
  static const Color primaryBackground = Color(0xFFF7F7F7);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Color(0xFF1E1E1E); // More visible in dark mode

  // Button colors
  static const Color buttonPrimary = primary; // Using primary for consistency
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);
  static const Color buttonDisabledDark = Color(0xFF424242); // Better contrast in dark mode
  static const Color buttonPrimaryDeepGreen = Color(0xFF21794F);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  static const Color borderDark = Color(0xFF5F6368); // For dark mode

  // Link Color
  static const Color linkBlueColor = tertiary; // Using tertiary for consistency
  static const Color linkRedColor = Color(0xFFD32F2F); // More professional red

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F); // Standard red
  static const Color errorLight = Color(0xFFEF5350); // Light red variant
  static const Color success = Color(0xFF388E3C); // Standard green
  static const Color successLight = Color(0xFF66BB6A); // Light green variant
  static const Color warning = Color(0xFFF9A825); // Standard amber
  static const Color warningLight = Color(0xFFFFCA28); // Light amber variant
  static const Color info = Color(0xFF1976D2); // Standard blue
  static const Color infoLight = Color(0xFF42A5F5); // Light blue variant
  static const Color popupColor = Color(0xffFEE89A);

  // Appbar colors
  static const Color appBarBackgroundColor = primary;
  static const Color appBarSearchBarBackgroundColor = Color(0xFF063F1F);
  static const Color appBarLight = Colors.white; // For light mode
  static const Color appBarDark = Color(0xFF1E1E1E); // For dark mode

  // Neutral Shades
  static const Color black = Color(0xFF0F0F0F);
  static const Color darkerGrey = Color(0xFF262626);
  static const Color darkGrey = Color(0xFF404040);
  static const Color grey = Color(0xFFA0A0A0);
  static const Color softGrey = Color(0xFFD7D7D7);
  static const Color lightGrey = Color(0xffF2F2F2);
  static const Color containerBackgroundColor = Color(0xffF5F5F5);
  static const Color white = Color(0xffFFFFFF);
  static const Color dragableBottomSheetColor = Color(0xffF2F2F2);

  // Feature-specific colors
  static const Color tripIndicator = secondary; // For tracking trips
  static const Color mapMarker = primary; // For map markers
  static const Color ratingActive = Color(0xFFFFC107); // Gold for active stars
  static const Color ratingInactive = Color(0xFFE0E0E0); // Gray for inactive stars

  // Dividers and shadows
  static const Color divider = Color(0xFFDADCE0); // Light mode dividers
  static const Color dividerDark = Color(0xFF5F6368); // Dark mode dividers
  static const Color shadow = Color(0x1A000000); // Shadows with opacity
}