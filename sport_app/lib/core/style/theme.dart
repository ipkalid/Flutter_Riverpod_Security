import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_app/core/style/app_colors.dart';

class AppTheme {
  static var theme = ThemeData(
    useMaterial3: true,

    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      // primary:,
      //  onPrimary:,
      //  primaryContainer:,
      //  onPrimaryContainer:,
      //  secondary:,
      //  onSecondary:,
      //  secondaryContainer:,
      //  onSecondaryContainer:,
      //  tertiary:,
      //  onTertiary:,
      //  tertiaryContainer:,
      //  onTertiaryContainer:,
      //  error:,
      //  onError:,
      //  errorContainer:,
      //  onErrorContainer:,
      //  outline:,
      //  outlineVariant:,
      //  background:,
      onPrimary: Colors.white,
      onBackground: Colors.white,
      //  surface:,
      onSurface: Colors.white,
      seedColor: AppColors.mauve,
      //  surfaceVariant:,
      onSurfaceVariant: Colors.white,
      //  inverseSurface:,
      onInverseSurface: Colors.white,
      //  inversePrimary:,
      //  shadow:,
      //  scrim:,
      //  surfaceTint:,
      //   seedColor: Colors.purple,
      //   // ···
      brightness: Brightness.dark,
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines:, titles:, bodies of text:, and more.
    // textTheme: GoogleFonts.quicksandTextTheme(),
    fontFamily: GoogleFonts.quicksand().fontFamily,

    // textTheme: GoogleFonts.openSans().fontFamily./
  );
}
