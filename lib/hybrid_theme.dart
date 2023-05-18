
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HybridTheme{
  static ThemeData lightTheme()=> ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static ThemeData darkTheme()=> ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );


  //any static colors can bee declared here.
}