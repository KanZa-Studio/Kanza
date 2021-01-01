import 'package:hive/hive.dart';

class PreferencesStoreService {
  PreferencesStoreService._();

  /// initialized [PreferencesStoreService]
  /// and opens [PreferencesBox] to store preferences
  static Future<void> init() async {
    if (_instance == null) {
      final box = await Hive.openBox('preferencesBox');
      _instance = PreferencesStoreService._();
      _instance._preferencesBox = box;
    }
  }

  static PreferencesStoreService _instance;
  static PreferencesStoreService get instance => _instance;

  Box _preferencesBox;

  Future<void> setDarkModeInfo(bool isDarkModeEnabled) =>
      _preferencesBox.put('theme', isDarkModeEnabled);

  bool get isDarkModeEnabled => _preferencesBox.get('theme');

  Future<void> setUserLogged() => _preferencesBox.put('user_logged', true);

  bool get isUserLogged => _preferencesBox.get('user_logged');

  Future<void> setLanguageCode(String languageCode) =>
      _preferencesBox.put('languageCode', languageCode);

  String get currentLanguageCode => _preferencesBox.get('languageCode');

  Future<void> setCountryCode(String languageCode) =>
      _preferencesBox.put('countryCode', languageCode);

  String get currentCountryCode => _preferencesBox.get('countryCode');
}
