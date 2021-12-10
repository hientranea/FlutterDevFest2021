import 'package:flutter/material.dart';

import 'crypto_tracker_color.dart';

class CryptoTrackerTheme {
  static ThemeData lightMode(BuildContext context) {
    return ThemeData(
      primaryColor: CryptoTrackerColors.primaryColor,
      scaffoldBackgroundColor: CryptoTrackerColors.scaffoldBackgroundColor,
      unselectedWidgetColor: Theme.of(context).primaryColor,
      cardColor: CryptoTrackerColors.scaffoldBackgroundColor,
      shadowColor: CryptoTrackerColors.containerShadow,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: CryptoTrackerColors.smokyBlack),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: CryptoTrackerColors.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Oxygen',
        ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Oxygen',
            bodyColor: Colors.black,
          ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: CryptoTrackerColors.accentColor),
    );
  }

  static ThemeData darkMode(BuildContext context) {
    return ThemeData(
      primaryColor: CryptoTrackerColors.darkPrimaryColor,
      scaffoldBackgroundColor: CryptoTrackerColors.darkScaffoldBackgroundColor,
      unselectedWidgetColor: CryptoTrackerColors.darkPrimaryColor,
      cardColor: CryptoTrackerColors.darkScaffoldBackgroundColor,
      shadowColor: CryptoTrackerColors.containerShadow,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: CryptoTrackerColors.smokyBlack),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: CryptoTrackerColors.darkScaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Oxygen',
        ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Oxygen',
            bodyColor: Colors.white,
          ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: CryptoTrackerColors.accentColor),
    );
  }
}
