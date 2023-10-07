import 'package:conversion_app/common/routes/name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class StorageService {
  late final SharedPreferences _sharedPreferences;
  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

//ini  saya buat 2 karena setBool untuk habis logout jadi tidak perlu ke splash screen
//untuk yang setString saya buat untuk ketika sudah masuk ke halaman login
//Digunakan untuk check point
  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
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

//Digunakan untuk memanggil terakhir di cek Point
  bool getBool() {
    return _sharedPreferences
            .getBool(AppConstant.STORAGE_DEVICE_OPEN_FRIST_TIME) ??
        false;
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
    final userImage = _sharedPreferences.getString(AppConstant.IMAGE_URL) ??
        'https://i.pinimg.com/564x/7c/8d/c5/7c8dc5fa07ecae922195c78a356b845b.jpg';
    return {'userId': userID, 'userEmail': userEmail, 'imageUrl': userImage};
  }

  //untuk pengguna fiktur gratis
  int getInt() {
    return _sharedPreferences.getInt(AppConstant.GRATIS) ?? 0;
  }
}
