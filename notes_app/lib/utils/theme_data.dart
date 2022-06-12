import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.brown,
    textTheme: TextTheme(
      headline1: GoogleFonts.openSans(
        textStyle: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
      headline2: GoogleFonts.openSans(
        textStyle: const TextStyle(
            fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      headline3: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.black54),
      ),
      headline4: GoogleFonts.openSans(
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      headline5: GoogleFonts.openSans(
        textStyle: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      // bodyText2: GoogleFonts.openSans(
      //   textStyle: const TextStyle(
      //       fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
      // ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
// GoogleFonts.montserrat

