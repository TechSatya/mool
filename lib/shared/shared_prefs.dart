import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    await init();
    return _sharedPrefs?.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await init();
    _sharedPrefs?.setString(key, value);
  }

  Future<String?> getBool(String key) async {
    await init();
    return _sharedPrefs?.getString(key);
  }

  Future<void> setBool(String key, String value) async {
    await init();
    _sharedPrefs?.setString(key, value);
  }

  Future<bool> containsKey(String key) async {
    await init();
    return _sharedPrefs!.containsKey(key);
  }
}
