import 'package:flutter/material.dart';
import 'package:secure_storage_sample_app/App.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_storage_sample_app/Services/SecureStorageService/ISecureStorageService.dart';
import 'package:secure_storage_sample_app/Services/SecureStorageService/SecureStorageService.dart';

final GetIt getit = GetIt.instance;

void main() {
  runApp(const App());

  getit.registerSingleton<ISecureStorageService>(SecureStorageService());
}
