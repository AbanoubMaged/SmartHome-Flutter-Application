import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black38,
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.w400)),
      ),

      body: Center(
        child: Container(
          child: Text(
            'Profile Screen',
            style: TextStyle(
              color: Colors.white70
            ),
            ),
        ),
      ),
    );
  }
}
