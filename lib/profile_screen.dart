import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String password;

  ProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String name;
  late String email;
  late String phone;
  late String password;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    phone = widget.phone;
    password = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.png'), // Add profile image to assets
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              initialValue: email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              initialValue: phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              initialValue: password,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle logout functionality
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
      ),
    );
  }
}

