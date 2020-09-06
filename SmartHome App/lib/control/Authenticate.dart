import 'package:flutter/material.dart';
import 'package:simple_login/screens/register.dart';
import 'package:simple_login/screens/login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLoginScreen = true;

  void toggleView(){
    // print(showLoginScreen.toString());
    setState(() => showLoginScreen = !showLoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    // return RegisterScreen();
   if (showLoginScreen) {
     return LoginScreen(toggleView: toggleView,);
   } else {
     return RegisterScreen(toggleView: toggleView);
   }
  }
}