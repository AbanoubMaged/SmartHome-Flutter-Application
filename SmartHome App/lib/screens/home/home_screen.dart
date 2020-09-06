import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_login/backend/AuthService.dart';
import 'package:simple_login/classes/user.dart';
import 'package:simple_login/screens/home/info_screen.dart';
import 'package:simple_login/screens/home/userAppBarInfo.dart';
import 'package:simple_login/screens/home/display.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/backend/DBService.dart';
import 'package:simple_login/screens/home/addDevice.dart';

class HomePage extends StatefulWidget {

  final String uid;
  HomePage({this.uid});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();

  // final devices = Provider.of<List<Device>>(context);

  // int deviceCount = 0;  // devices.length

  @override
  Widget build(BuildContext context) {

    void _showAddDeviceForm(String uid) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(color: Colors.cyan[800], width: 2),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          child: AddDeviceForm(uid: uid),
        );},
        backgroundColor: Colors.blueGrey[900],
        elevation: 4
      );
    }

    // final userData = Provider.of<List<User>>(context);

    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: widget.uid).userDataStream,  // listening to user data stream

      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],

        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.black54,
          title: UserAppBarInfo(uid: widget.uid),
          actions: <Widget>[

            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white70,
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen())),
            ),

            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red[900],
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      'LOGOUT',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blueGrey[700],
                    content: Text('Are you sure you want to logout?'),
                    contentTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                    actions: <Widget>[

                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.cyan[700]),
                        )
                      ),
                      
                      FlatButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          await _auth.signOut();
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.cyan[700]),
                        )
                      ),
                    ],
                  )
                );
              },
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),

              child: Display(uid: widget.uid)
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Device',
          elevation: 5,
          child: Icon(
            Icons.add,
            color: Colors.black87,
          ),
          backgroundColor: Colors.cyan[800],
          splashColor: Colors.black26,
          onPressed: () => _showAddDeviceForm(widget.uid)
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   color: Colors.black54,
        //   elevation: 2,
        //   child: Container(height: 0),
        // ),
      ),
    );
  }
}