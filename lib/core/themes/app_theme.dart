import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF134C67),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFC2E8FF),
      onPrimaryContainer: Color(0xFF001E2C),

      secondary: Color(0xFF7CB2CC),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFE1F4FF),
      onSecondaryContainer: Color(0xFF001F2A),

      error: Color(0xFFDB553E),
      onError: Colors.white,

      surface: Color(0xFFECCA60),
      onSurface: Color(0xFF221B00),
      surfaceContainerHighest: Color(0xFFDEE3EB),
      onSurfaceVariant: Color(0xFF42474E),

      outline: Color(0xFFB3B6BC),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF8BCEEF),
      onPrimary: Color(0xFF003549),
      primaryContainer: Color(0xFF004D67),
      onPrimaryContainer: Color(0xFFC2E8FF),

      secondary: Color(0xFF7CB2CC),
      onSecondary: Color(0xFF003549),
      secondaryContainer: Color(0xFF1E4D61),
      onSecondaryContainer: Color(0xFFC2E8FF),

      error: Color(0xFFFFB4A9),
      onError: Color(0xFF690005),

      surface: Color(0xFF1A1C1E),
      onSurface: Color(0xFFE2E2E6),
      surfaceContainerHighest: Color(0xFF42474E),
      onSurfaceVariant: Color(0xFFC2C7CF),

      outline: Color(0xFF8C9199),
      tertiary: Color(0xFFECCA60),
      onTertiary: Color(0xFF3F2E00),
    ),
  );
}
