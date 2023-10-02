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
}
