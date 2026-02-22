import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static const _settingsBoxName = 'settings';
  static late Box<dynamic> _settingsBox;
  static const _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox<dynamic>(_settingsBoxName);
  }

  // Secure storage (tokens, keys)
  static Future<void> saveSecure(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String?> readSecure(String key) async {
    return _secureStorage.read(key: key);
  }

  static Future<void> deleteSecure(String key) async {
    await _secureStorage.delete(key: key);
  }

  // Settings (Hive)
  static Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  static dynamic readSetting(String key, {dynamic defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> deleteSetting(String key) async {
    await _settingsBox.delete(key);
  }

  static Future<void> clearAll() async {
    await _settingsBox.clear();
    await _secureStorage.deleteAll();
  }
}
