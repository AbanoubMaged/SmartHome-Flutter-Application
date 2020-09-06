import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_login/backend/DBService.dart';
import 'package:simple_login/backend/notification.dart';
// import 'package:simple_login/backend/notification.dart';
import 'package:simple_login/classes/sensor.dart';

class SensorDisplay extends StatefulWidget {

  // final String uid;
  // SensorDisplay({this.uid});

  @override
  _SensorDisplayState createState() => _SensorDisplayState();
}

class _SensorDisplayState extends State<SensorDisplay> {

  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_stat_smarthomesplash');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, iOS);
    notificationService.flutterLocalNotificationsPlugin.initialize(initSettings);// onSelectNotification: notificationService.onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Sensor>>(
      stream: DatabaseService().sensorStream,
      builder: (context, snapshot) {
        
        if(snapshot.hasData) {  // check that there is data came from the stream

          notificationService.checkStatus(snapshot.data);  // check sensors status according to reading for notification display

          if(snapshot.data != null) {
            
            return Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.black45
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.5),

                child: GridView.count(
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    // Temperature
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      color: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: snapshot.data[1].status ? Colors.redAccent[700] : Colors.greenAccent[700],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 9),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white10,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image(image: AssetImage('assets/temp.png')),
                              ),
                            ),
                            SizedBox(height: 11),
                            Text(
                              '${snapshot.data[1].value} C',
                              style: TextStyle(
                                color: snapshot.data[1].status ? Colors.red : Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Humidity
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      color: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: snapshot.data[0].status ? Colors.redAccent[700] : Colors.greenAccent[700],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 9),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white10,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image(image: AssetImage('assets/humi.png')),
                              ),
                            ),
                            SizedBox(height: 11),
                            Text(
                              '${snapshot.data[0].value} %',
                              style: TextStyle(
                                color: snapshot.data[0].status ? Colors.red : Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Gas
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      color: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: snapshot.data[3].status ? Colors.redAccent[700] : Colors.greenAccent[700],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 9),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white10,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image(image: AssetImage('assets/gas.png')),
                              ),
                            ),
                            SizedBox(height: 11),
                            Text(
                              snapshot.data[3].status ? 'Leaking' : 'Safe',
                              style: TextStyle(
                                color: snapshot.data[3].status ? Colors.red[700] : Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Water
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      color: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: snapshot.data[4].status ? Colors.redAccent[700] : Colors.greenAccent[700],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 9),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white10,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image(image: AssetImage('assets/water.png')),
                              ),
                            ),
                            SizedBox(height: 11),
                            Text(
                              snapshot.data[4].status ? 'Leaking' : 'Safe',
                              style: TextStyle(
                                color: snapshot.data[4].status ? Colors.red[700] : Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Door
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      color: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: snapshot.data[2].status ? Colors.redAccent[700] : Colors.greenAccent[700],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 9),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white10,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image(image: AssetImage('assets/ultra.png')),
                              ),
                            ),
                            SizedBox(height: 11),
                            Text(
                              snapshot.data[2].status ? 'Open' : 'Closed',
                              style: TextStyle(
                                color: snapshot.data[2].status ? Colors.red[700] : Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: 13
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );

          } else {
            
            return Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.black45
              ),
              child: Center(
                child: Text(
                  'No Sensors Found',
                  style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.w300
                  ),
                ),
              )
            );

          }

        } else {

          return Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // color: Colors.black45
            ),
            child: Center(
              child: CircularProgressIndicator(),
            )
          );

        }

      }
    );
  }
}