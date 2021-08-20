import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  var _flutterSecureStorage;

  static final AppStorage _singleton = new AppStorage._internal();

  AppStorage._internal() {
    _flutterSecureStorage = new FlutterSecureStorage();
  }

  static AppStorage get appStorage => _singleton;

  FlutterSecureStorage get _storage {
    if (_flutterSecureStorage != null) {
      return _flutterSecureStorage;
    }
    _flutterSecureStorage = new FlutterSecureStorage();
    return _flutterSecureStorage;
  }

  Future<String?> getValue(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  Future<void> setValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> clearValue(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
