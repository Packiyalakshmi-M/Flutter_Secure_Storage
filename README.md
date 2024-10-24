# Flutter Secure Storage

This project implements a basic login screen in a Flutter application, utilizing secure storage to save and manage user credentials (username and password). The app allows users to save their credentials securely and automatically fills the saved values the next time they open the app. Additionally, users can delete their stored data if desired. The project uses the provider package for state management and the flutter_secure_storage package for secure data storage.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Author](#author)

## Features

- **Secure Storage:** Stores the user's credentials (username and password) securely using flutter_secure_storage.
- **Automatic Prefill:** On returning to the app, previously saved credentials are automatically filled into the respective fields.
- **Delete Functionality:** Users can delete the stored data from secure storage using the delete button.
- **Provider State Management:** Text field states are managed using the provider package for efficient state management.
- **Cross-platform Support:** Works seamlessly on both iOS and Android devices.

## Technologies Used

- **Programming Language:** Dart
- **Framework:** Flutter
- **Secure Storage Library:** `flutter_secure_storage` package
- **Others:**
  - Flutter SDK
  - Android Studio / Visual Studio Code for development
  - Git for version control

## Installation

Follow these steps to get the project up and running locally:

```bash
# Clone the repository
git clone https://github.com/Packiyalakshmi-M/Flutter_Secure_Storage.git

# Navigate into the project directory
cd secure_storage_sample_app

# Install dependencies
flutter pub get
```

## Usage

The following snippet shows a basic usage of flutter_secure_storage to save, retrieve, and delete the username and password:

```

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

```

## License

This project is open source and available under the MIT License.

## Author

- Packiyalakshmi Murugan
- [LinkedIn Link](https://www.linkedin.com/in/packiyalakshmi-m-7a9844210/)
- [Github link](https://github.com/Packiyalakshmi-M/)
