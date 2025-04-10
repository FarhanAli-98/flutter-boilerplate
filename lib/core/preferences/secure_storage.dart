import 'package:template/core/constants/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: AppConstant.tokenKey, value: token);
  }

  Future<void> saveChatId(String token) async {
    await _storage.write(key: AppConstant.chatIdKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: AppConstant.tokenKey);
  }

  Future<String?> getChatId() async {
    return await _storage.read(key: AppConstant.chatIdKey);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: AppConstant.tokenKey);
  }

  Future<void> clearChatId() async {
    await _storage.delete(key: AppConstant.chatIdKey);
  }
}
