// lib/providers/user_provider.dart

import 'package:flutter/material.dart';
import '''package:shared_preferences/shared_preferences.dart''';
import '../models/user.dart'; // import the User model

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final phoneNumber = prefs.getString('phoneNumber');
    final password = prefs.getString('password');

    if (name != null && email != null && phoneNumber != null && password != null) {
      _user = User(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      notifyListeners();
    }
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setString('phoneNumber', user.phoneNumber);
    await prefs.setString('password', user.password);

    _user = user;
    notifyListeners();
  }
}
