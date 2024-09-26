import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_storage_sample_app/Services/SecureStorageService/ISecureStorageService.dart';
import 'package:secure_storage_sample_app/Services/SecureStorageService/SecureStorageService.dart';

class HomeScreenProvider with ChangeNotifier, DiagnosticableTreeMixin {
  // For read, write and update Username
  String _username = "";

  String get username => _username;

  void updateUsername({required String name}) {
    _username = name;
    notifyListeners();
  }

  // For read, write and update Password
  String _password = "";

  String get password => _password;

  void updatePassword({required String password}) {
    _password = password;
    notifyListeners();
  }

  // Create an instance for ISecureStorageservice
  final ISecureStorageService _secureStorageService =
      GetIt.instance<ISecureStorageService>();

  // To fetch the secure storage data
  Future<bool> fetchSecureStorageData() async {
    try {
      _username = await _secureStorageService.getData(key: 'username');
      _password = await _secureStorageService.getData(key: 'password');
      return true;
    } catch (ex) {
      print("Exception: ${ex.toString()}");
      return false;
    }
  }

  // To save the secure storage data
  void saveSecureStorageData() async {
    try {
      await _secureStorageService.saveData(key: 'username', value: username);
      await _secureStorageService.saveData(key: 'password', value: password);
    } catch (ex) {
      print("Exception: ${ex.toString()}");
    }
  }

  // To delete the secure storage data
  Future<bool> deleteSecureStorageData() async {
    try {
      bool response = await _secureStorageService.deleteAllData();
      if (response) {
        updateUsername(name: "");
        updatePassword(password: "");
      }
      return response;
    } catch (ex) {
      print("Exception: ${ex.toString()}");
      return false;
    }
  }

  /// Makes `HomeScreenProvider` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('username', username));
    properties.add(StringProperty('password', password));
  }
}
