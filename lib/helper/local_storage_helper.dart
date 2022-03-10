import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService with ILocalStorage<SharedPreferences?> {
  static SharedPreferenceService? _instance;
  static SharedPreferenceService? get instance =>
      _instance ??= SharedPreferenceService();
  SharedPreferences? _preferences;

  @override
  Future<SharedPreferences?> getInstance() async {
    _instance ??= SharedPreferenceService();
    _preferences ??= await SharedPreferences.getInstance();
  }

  @override
  Future<Object?> read(String key) async {
    return _preferences?.get(key);
  }

  @override
  Future<bool?> save(String key, String value) async {
    return await _preferences?.setString(key, value);
  }

  @override
  Future<bool?> saveStringList(String key, String value) async {
    var list = _preferences?.getStringList(key) ?? <String>[];
    list.add(value);
    return await _preferences?.setStringList(key, list);
  }

  @override
  Future<List<String?>> getStringList(String key) async {
    return _preferences?.getStringList(key) ?? <String>[];
  }
}

abstract class ILocalStorage<T> {
  Future<T?> getInstance();
  Future<bool?> save(String key, String value);
  Future<bool?> saveStringList(String key, String value);
  Future<List<String?>> getStringList(String key);
  Future<Object?> read(String key);
}
