import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  final SharedPreferences _sharedPreferences;

  SharedPrefHelper(this._sharedPreferences);

  Future<bool> setValue({required dynamic value, required String key}) async {
    return await _sharedPreferences.setString(key, value);
  }

  dynamic getValue({required String key}) {
    return _sharedPreferences.getString(key);
  }
}
