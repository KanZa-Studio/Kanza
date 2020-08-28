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

  Future<bool> setUsername(String username) async =>
      await _preferences.setString('username', username);

  String get username => _preferences.getString('username');
}
