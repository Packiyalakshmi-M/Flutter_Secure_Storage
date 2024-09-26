abstract class ISecureStorageService {
  Future<String> getData({required String key});
  Future<bool> saveData({required String key, required String value});
  Future<bool> deleteData({required String key});
  Future<bool> deleteAllData();
}
