import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 26,
      ),
      headlineSmall: GoogleFonts.quicksand(
        fontWeight: FontWeight.w500,
        color: Colors.grey,
        fontSize: 15,
      ),
      titleLarge: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
      titleMedium: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 15,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.quicksand(
        fontWeight: FontWeight.w500,
        color: Colors.grey[400],
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
