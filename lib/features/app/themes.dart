import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(72, 74, 126, 1),
    ),
  );


  // ThemeData(
  //   appBarTheme: AppThemes.appBarTheme,
  //   scaffoldBackgroundColor: Colors.grey[900],
  //   textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  // );
  static AppBarTheme appBarTheme =
  const AppBarTheme(backgroundColor: Colors.black);
}
