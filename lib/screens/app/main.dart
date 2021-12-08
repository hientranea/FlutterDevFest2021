import 'package:crypto_tracker/config/routes.dart';
import 'package:crypto_tracker/config/theme.dart';
import 'package:crypto_tracker/repos/crypto_tracker_services.dart';
import 'package:crypto_tracker/repos/local/app_preferences.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/splash/splash_bloc.dart';
import 'package:crypto_tracker/screens/splash/splash_event.dart';
import 'package:crypto_tracker/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

var themeMode = ThemeMode.light;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(CryptoTracker());
}

class CryptoTracker extends StatelessWidget {
  CryptoTracker({Key? key}) : super(key: key);
  final CryptoTrackerServices _services = CryptoTrackerServicesImpl();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppPreferences>(
            create: (context) => AppPreferencesImpl()),
        RepositoryProvider<CryptoRepository>(
            create: (context) => CryptoRepositoryImpl()),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          preferences: RepositoryProvider.of<AppPreferences>(context),
          services: _services,
        )..add(AppInitializeEvent()),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            Widget home = Container();

            if (state is AppReady) {
              home = BlocProvider(
                create: (context) => SplashBloc()..add(SplashInitializeEvent()),
                child: const SplashScreen(),
              );
            }

            if (state is AppChangeDarkMode) {
              themeMode = state.isDarkMode ? ThemeMode.dark : ThemeMode.light;
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: CryptoTrackerTheme.lightMode(context),
              darkTheme: CryptoTrackerTheme.darkMode(context),
              themeMode: themeMode,
              routes: cryptoTrackerRoutes,
              home: home,
            );
          },
        ),
      ),
    );
  }
}
