import 'package:crypto_tracker/config/theme.dart';
import 'package:crypto_tracker/repos/local/app_preferences.dart';
import 'package:crypto_tracker/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

var themeMode = ThemeMode.light;

void main() {
  runApp(const CryptoTracker());
}

class CryptoTracker extends StatelessWidget {
  const CryptoTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppPreferences>(create: (context) => AppPreferencesImpl()),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          preferences: RepositoryProvider.of<AppPreferences>(context)
        )..add(AppInitializeEvent()),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            Widget home = Container();

            if (state is AppReady) {
              home = const SplashScreen();
            }

            if (state is AppChangeDarkMode) {
              themeMode = state.isDarkMode ? ThemeMode.dark : ThemeMode.light;
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: CryptoTrackerTheme.lightMode(context),
              darkTheme: CryptoTrackerTheme.darkMode(context),
              themeMode: themeMode,
              home: home,
            );
          },
        ),
      ),
    );
  }
}
