import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/backend/AuthService.dart';
import 'package:simple_login/classes/user.dart';
import 'package:simple_login/control/Wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().userStream,
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}


