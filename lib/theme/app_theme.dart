import 'package:flutter/material.dart';
import 'package:hybrid/theme/color_pallet.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      useMaterial3: true,
      cardColor: Pallet.resinBlack,
    
      brightness: Brightness.dark,
  );
}
