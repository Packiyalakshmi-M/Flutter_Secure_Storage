import 'package:flutter/material.dart';
import 'package:secure_storage_sample_app/Pages/HomeScreen/HomeScreenProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HomeScreenProvider _homeScreenProvider = HomeScreenProvider();

  void getUserData() async {
    try {
      bool response = await _homeScreenProvider.fetchSecureStorageData();
      if (response) {
        _userNameController.text = _homeScreenProvider.username;
        _passwordController.text = _homeScreenProvider.password;
      }
    } catch (ex) {
      print("Exception: ${ex.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _userNameController,
                onChanged: (value) {
                  _homeScreenProvider.updateUsername(name: value);
                },
                decoration: InputDecoration(
                  hintText: 'Username',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF4B1535),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF4B1535),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _passwordController,
                  onChanged: (value) {
                    _homeScreenProvider.updatePassword(password: value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFF4B1535),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFF4B1535),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      _homeScreenProvider.saveSecureStorageData();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text('Save Data'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool response =
                          await _homeScreenProvider.deleteSecureStorageData();
                      if (response) {
                        _userNameController.text = "";
                        _passwordController.text = "";
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text('Delete Data'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
