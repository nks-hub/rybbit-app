import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> init();

  Future<void> saveSecure(String key, String value);
  Future<String?> readSecure(String key);
  Future<void> deleteSecure(String key);

  Future<void> saveSetting(String key, dynamic value);
  dynamic readSetting(String key, {dynamic defaultValue});
  Future<void> deleteSetting(String key);

  Future<void> clearAll();
}

class StorageServiceImpl implements StorageService {
  late SharedPreferences _prefs;
  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveSecure(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return;
    } catch (_) {
      // Keychain unavailable (e.g. missing entitlements on simulator) - fall back to SharedPreferences
    }
    await _prefs.setString('_s_$key', value);
  }

  @override
  Future<String?> readSecure(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value != null && value.isNotEmpty) return value;
    } catch (_) {
      // SecureStorage failed, try SharedPreferences fallback
    }
    return _prefs.getString('_s_$key');
  }

  @override
  Future<void> deleteSecure(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (_) {
      // Keychain unavailable
    }
    // Always clean up SharedPreferences fallback entry as well
    await _prefs.remove('_s_$key');
  }

  @override
  Future<void> saveSetting(String key, dynamic value) async {
    if (value == null) {
      await _prefs.remove(key);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else {
      await _prefs.setString(key, value.toString());
    }
  }

  @override
  dynamic readSetting(String key, {dynamic defaultValue}) {
    final value = _prefs.get(key);
    return value ?? defaultValue;
  }

  @override
  Future<void> deleteSetting(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await _prefs.clear();
    await _secureStorage.deleteAll();
  }
}

final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('storageServiceProvider must be overridden in main()');
});
