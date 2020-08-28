import '../contractors/base_auth_repository.dart';
import '../services/shared_preferences_service.dart';

class AuthRepository implements BaseAuthRepository {
  @override
  Future<String> loggedUser() async {
    final sharedPrefService = await SharedPreferencesService.instance;
    return sharedPrefService.username;
  }
}
