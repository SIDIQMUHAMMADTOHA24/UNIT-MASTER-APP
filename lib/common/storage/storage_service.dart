
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _sharedPreferences;
  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  bool autoLogin() {
    return _sharedPreferences.getBool('login') ?? false;
  }
}
