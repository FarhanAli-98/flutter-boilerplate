import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

abstract class BasePreferences {
  /// * To store encrypted app data i.e. JWT or Other critical user access token ***/
  static const _secureStorage = FlutterSecureStorage(
    iOptions: IOSOptions(synchronizable: false),
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  /// Store a value securely
  static Future<void> saveSecurePref(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Retrieve a specific secure value
  static Future<String?> getSecurePref(String key) async {
    return await _secureStorage.read(key: key);
  }

  /// Retrieve all stored values
  static Future<Map<String, String>> retrieveAllSecurePrefs() async {
    return await _secureStorage.readAll();
  }

  /// Check if all required keys exist in storage
  static Future<bool> hasAllRequiredPrefs(List<String> requiredKeys) async {
    final storedData = await retrieveAllSecurePrefs();
    return requiredKeys.every((key) => storedData.containsKey(key) && storedData[key]!.isNotEmpty);
  }

  /// Remove a specific key from storage
  static Future<void> removeSecurePref(String key) async {
    await _secureStorage.delete(key: key);
  }

  /// Remove all keys from storage
  static Future<void> removeAllSecurePrefs() async {
    await _secureStorage.deleteAll();
  }

  /// * To store not critical app data ***/
  final _storage = GetStorage();

  void remove(String key) => _storage.remove(key);

  void removeAll(String key) => _storage.erase();

  T? retrieve<T>(String key) => _storage.read(key);

  void store<T>(String key, T value) => _storage.write(key, value);
}
