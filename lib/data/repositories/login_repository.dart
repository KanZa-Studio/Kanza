import '../contractors/base_login_repository.dart';
import '../services/shared_preferences_service.dart';

class LoginRepository implements BaseLoginRepository {
  @override
  Future<bool> loginUser(String username) async {
    final sharedPrefService = await SharedPreferencesService.instance;
    return sharedPrefService.setUsername(username);
  }
}
