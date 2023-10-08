import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class StorageService {
  late final SharedPreferences _sharedPreferences;
  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  Future<void> saveUserInfo({
    required String userId,
    required String email,
  }) async {
    await _sharedPreferences.setString(AppConstant.EMAIL, email);
    await _sharedPreferences.setString(AppConstant.USER_ID, userId);
  }

  Future<bool> cobaGratis(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  bool getString() {
    return _sharedPreferences.getString(AppConstant.STORAGE_USER_TOKEN_KEY) ==
            null
        ? false
        : true;
  }

  Map<String, dynamic> getUserInfo() {
    final userID =
        _sharedPreferences.getString(AppConstant.USER_ID) ?? 'kosong';
    final userEmail =
        _sharedPreferences.getString(AppConstant.EMAIL) ?? 'kosong';
    return {
      'userId': userID,
      'userEmail': userEmail,
    };
  }

  //untuk pengguna fiktur gratis
  int getInt() {
    return _sharedPreferences.getInt(AppConstant.GRATIS) ?? 0;
  }
}
