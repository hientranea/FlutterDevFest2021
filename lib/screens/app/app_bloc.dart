import 'package:crypto_tracker/repos/local/app_preferences.dart';
import 'package:bloc/bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppPreferences preferences;

  AppBloc({required this.preferences}) : super(AppInitialize());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppInitializeEvent) {
      await preferences.init();

      yield AppChangeDarkMode(preferences.isDarkMode ?? false);
      yield AppReady();
    }

    if (event is ChangeDarkModeEvent) {
      await preferences.setDarkMode(event.isDarkMode);
      yield AppChangeDarkMode(event.isDarkMode);
    }
  }
}
