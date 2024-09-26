import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_storage_sample_app/Services/SecureStorageService/ISecureStorageService.dart';

class SecureStorageService implements ISecureStorageService {
  // Create an object for FlutterSecureStorage
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<bool> deleteAllData() async {
    try {
      await storage.deleteAll();
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<bool> deleteData({required String key}) async {
    try {
      await storage.delete(key: key);
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<String> getData({required String key}) async {
    try {
      var response = await storage.read(key: key);
      return response ?? "";
    } catch (ex) {
      return "";
    }
  }

  @override
  Future<bool> saveData({required String key, required String value}) async {
    try {
      await storage.write(key: key, value: value);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
