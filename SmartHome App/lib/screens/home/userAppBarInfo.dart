import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/classes/user.dart';
import 'package:simple_login/screens/profile.dart';

class UserAppBarInfo extends StatefulWidget {

    final String uid;
    UserAppBarInfo({ this.uid });

  @override
  _UserAppBarInfoState createState() => _UserAppBarInfoState();
}

class _UserAppBarInfoState extends State<UserAppBarInfo> {

  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<UserData>(context);

    Future.delayed(Duration(seconds: 5));

    return ListTile(
      enabled: false,
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile())),
      contentPadding: EdgeInsets.only(left: 7),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.cyan[900],
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/man.png'),
        ),
      ),

      title: Text(
        userData.name ?? 'ERROR',
        style: TextStyle(
          color: Colors.cyan[600],
          fontSize: 16,
          fontWeight: FontWeight.w400
        )
      ),

      subtitle: Text(
        userData.email ?? 'ERROR',
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w200,
          fontSize: 10
        )
      ),

    );
  }
}