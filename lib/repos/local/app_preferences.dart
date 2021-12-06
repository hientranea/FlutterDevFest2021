import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPreferences {
  Future init();

  Future<void> setDarkMode(bool isDarkMode);

  bool? isDarkMode;
}

class AppPreferencesImpl extends AppPreferences {
  static final AppPreferencesImpl _singleton = AppPreferencesImpl._internal();
  static late final SharedPreferences _prefs;
  static const checkIsDarkMode = "IS_DARK_MODE";

  AppPreferencesImpl._internal();

  factory AppPreferencesImpl() {
    return _singleton;
  }

  @override
  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setDarkMode(bool isDarkMode) async {
    await _setOrRemove<bool>(checkIsDarkMode, isDarkMode);
  }

  @override
  bool? get isDarkMode => _get<bool>(checkIsDarkMode);

  T? _get<T>(String key) {
    if (!_prefs.containsKey(key)) {
      return null;
    }
    switch (T) {
      case bool:
        return _prefs.getBool(key) as T;
      case String:
        return _prefs.getString(key) as T;
      case List:
        return _prefs.getStringList(key) as T;

      default:
        return null;
    }
  }

  Future<void> _setOrRemove<T>(String key, T? value) async {
    if (value == null) {
      await _prefs.remove(key);
      return;
    }

    switch (T) {
      case bool:
        await _prefs.setBool(key, value as bool);
        break;
      case String:
        await _prefs.setString(key, value as String);
        break;
      case List:
        await _prefs.setStringList(key, value as List<String>);
        break;
      default:
    }
  }
}
