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

  // Secure storage (tokens, keys) with Hive fallback only when FlutterSecureStorage fails.
  static Future<void> saveSecure(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return; // Secure storage succeeded - do NOT duplicate to plaintext Hive
    } catch (_) {
      // Keychain unavailable (e.g. missing entitlements on simulator) - fall back to Hive
    }
    await _settingsBox.put('_s_$key', value);
  }

  static Future<String?> readSecure(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value != null && value.isNotEmpty) return value;
    } catch (_) {
      // SecureStorage failed, try Hive fallback
    }
    return _settingsBox.get('_s_$key') as String?;
  }

  static Future<void> deleteSecure(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (_) {
      // Keychain unavailable
    }
    // Always clean up Hive fallback entry as well
    await _settingsBox.delete('_s_$key');
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
