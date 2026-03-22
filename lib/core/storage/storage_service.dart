import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  static const _settingsBoxName = 'settings';
  late Box<dynamic> _settingsBox;
  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox<dynamic>(_settingsBoxName);
  }

  @override
  Future<void> saveSecure(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return;
    } catch (_) {
      // Keychain unavailable (e.g. missing entitlements on simulator) - fall back to Hive
    }
    await _settingsBox.put('_s_$key', value);
  }

  @override
  Future<String?> readSecure(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value != null && value.isNotEmpty) return value;
    } catch (_) {
      // SecureStorage failed, try Hive fallback
    }
    return _settingsBox.get('_s_$key') as String?;
  }

  @override
  Future<void> deleteSecure(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (_) {
      // Keychain unavailable
    }
    // Always clean up Hive fallback entry as well
    await _settingsBox.delete('_s_$key');
  }

  @override
  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  @override
  dynamic readSetting(String key, {dynamic defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> deleteSetting(String key) async {
    await _settingsBox.delete(key);
  }

  @override
  Future<void> clearAll() async {
    await _settingsBox.clear();
    await _secureStorage.deleteAll();
  }
}

final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('storageServiceProvider must be overridden in main()');
});
