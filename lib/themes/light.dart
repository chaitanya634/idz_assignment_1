import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    textTheme: 
    TextTheme(
      headlineLarge: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 32,
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
