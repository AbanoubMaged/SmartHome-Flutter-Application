import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/classes/user.dart';
import 'package:simple_login/screens/home/home_screen.dart';
import 'package:simple_login/control/Authenticate.dart';


class Wrapper extends StatelessWidget {

  void startServiceInPlatform() async {
    if(Platform.isAndroid){
      var methodChannel = MethodChannel("com.retroportalstudio.messages");
      String data = await methodChannel.invokeMethod("startService");
      debugPrint(data);
    }
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      startServiceInPlatform();
      return HomePage(uid: user.id,);
    }
  }
}
