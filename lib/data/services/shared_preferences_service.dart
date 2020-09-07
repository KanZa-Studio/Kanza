import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._internal();

  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> setLanguageCode(String languageCode) =>
      _preferences.setString('languageCode', languageCode);

  String get languageCode => _preferences.getString('languageCode');

  Future<void> setCountryCode(String countryCode) =>
      _preferences.setString('countryCode', countryCode);

  String get countryCode => _preferences.getString('countryCode');

  Future<void> setDarkModeInfo(bool isDarkModeEnabled) =>
      _preferences.setBool('theme', isDarkModeEnabled);

  bool get isDarkModeEnabled => _preferences.getBool('theme');

  Future<void> setUserLogged() => _preferences.setBool('logged', true);

  bool get userLogged => _preferences.getBool('logged');
}
