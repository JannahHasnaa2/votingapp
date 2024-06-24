import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedName = prefs.getString('name') ?? '';
    String savedPassword = prefs.getString('password') ?? '';

    if (_usernameController.text == savedName && _passwordController.text == savedPassword) {
      Navigator.pushReplacementNamed(
        context,
        '/profile',
        arguments: {
          'name': savedName,
          'email': prefs.getString('email') ?? '',
          'phone': prefs.getString('phone') ?? '',
          'password': savedPassword,
        },
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/927/927295.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _login,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Implement password reset functionality
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

