import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_login/backend/DBService.dart';
import 'package:simple_login/classes/device.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  final String uid;
  DeviceCard({this.device, this.uid});

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    bool switchVal = widget.device.status; //false;

    return widget.device == null ? Container() : Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: Colors.black87, //black87  //white10
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // card Header container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: switchVal ? Colors.greenAccent[700] : Colors.red[700],),
                // color: Colors.black87,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.power_settings_new),
                        onPressed: () async {
                          switchVal = !switchVal;
                          await DatabaseService(uid: widget.uid).changeDeviceStatus(
                              did: widget.device.id,
                              status: switchVal);
                              setState(() => switchVal);
                              },
                        iconSize: 20,
                        color: switchVal ? Colors.green : Colors.red,
                      ),
                      Text(
                        widget.device.name, // Device Name
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(
                                      title: Text(
                                        'DELETE DEVICE',
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      backgroundColor:
                                      Colors.blueGrey[700],
                                      content: Text(
                                          'Are you sure you want to delete this device?'),
                                      contentTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                      actions: <Widget>[
                                        FlatButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color:
                                                  Colors.cyan[700]),
                                            )),
                                        FlatButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              await DatabaseService(
                                                  uid: widget.uid)
                                                  .deleteDeviceData(
                                                  widget.device.id);
                                              Fluttertoast.showToast(
                                                  msg:
                                                  'Device deleted successfully');
                                              },
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color:
                                                  Colors.cyan[700]),
                                            )),
                                      ],
                                    ));
                                },
                          iconSize: 20,
                          color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
