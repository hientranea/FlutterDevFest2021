import 'package:flutter/material.dart';

import 'crypto_tracker_color.dart';

class CryptoTrackerTheme {
  static ThemeData lightMode(BuildContext context) {
    return ThemeData(
      primaryColor: CryptoTrackerColors.primaryColor,
      scaffoldBackgroundColor: CryptoTrackerColors.greyBackground,
      unselectedWidgetColor: CryptoTrackerColors.primaryColor,
      cardColor: Colors.white,
      shadowColor: CryptoTrackerColors.containerShadow,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: CryptoTrackerColors.smokyBlack),
      ),
      appBarTheme: const AppBarTheme(elevation: 0.0, backgroundColor: Colors.white),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Oxygen',
            bodyColor: CryptoTrackerColors.smokyBlack,
          ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: CryptoTrackerColors.accentColor),
    );
  }

  static ThemeData darkMode(BuildContext context) {
    return ThemeData(
      primaryColor: CryptoTrackerColors.darkPrimaryColor,
      scaffoldBackgroundColor: CryptoTrackerColors.darkBackground,
      canvasColor: CryptoTrackerColors.darkBackground,
      unselectedWidgetColor: CryptoTrackerColors.darkPrimaryColor,
      cardColor: CryptoTrackerColors.darkCardBackground,
      shadowColor: CryptoTrackerColors.containerShadow,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: const Color(0xFFF6F6F6)),
      ),
      appBarTheme:
          const AppBarTheme(elevation: 0.0, backgroundColor: CryptoTrackerColors.darkPrimaryColor),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Oxygen',
            bodyColor: const Color(0xFFF6F6F6),
          ),
    );
  }
}
