import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'profile_screen.dart';  // Ensure ProfileScreen is imported only from here

void main() {
  runApp(VoteWiseApp());
}

class VoteWiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoteWise',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return ProfileScreen(
                name: args['name']!,
                email: args['email']!,
                phone: args['phone']!,
                password: args['password']!,
              );
            },
          );
        }
        // Handle other routes
        return null;
      },
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),  // Ensure LoginScreen is defined
      },
    );
  }
}




