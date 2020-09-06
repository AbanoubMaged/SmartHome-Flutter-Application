import 'package:flutter/material.dart';
import 'package:simple_login/backend/DBService.dart';
import 'package:simple_login/classes/device.dart';
import 'package:simple_login/screens/home/deviceCard.dart';
import 'package:simple_login/screens/home/sensorDisplay.dart';

class Display extends StatefulWidget {

  final String uid;
  Display({this.uid});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Device>>(
      stream: DatabaseService(uid: widget.uid).deviceStream,
      builder: (context, snapshot) {

        if(snapshot.hasData && snapshot.data.length != null) {
          
          if(snapshot.data.length != 0) {
          
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                // sensor readings container
                SensorDisplay(),

                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 80),
                      child: Text(
                        'Connected Devices:',
                        style: TextStyle(
                            color: Colors.blueGrey[100],
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                    ),

                    // device count text from DB
                    Text(
                      '${snapshot.data.length} Devices', 
                      style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-275, //- 245,//310, // the height of the screen - the height of the buttom bar
//                  color: Colors.black38,

                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: DeviceCard(device: snapshot.data[index], uid: widget.uid,),
                      );
                    },
                  ),
                ),
              ]
            );

          } else {
          
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                // sensor readings container
                SensorDisplay(),

                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 100),
                      child: Text(
                        'Connected Devices:',
                        style: TextStyle(
                            color: Colors.blueGrey[100],
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                    ),

                    // device count text from DB
                    Text(
                      '0 Devices', 
                      style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 310, // the height of the screen - the height of the buttom bar
                  // color: Colors.black38,

                  child: Center(
                    child: Text(
                      'No Devices Found',
                      style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              ]
            );

          }

        } else {

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              // sensor readings container
              SensorDisplay(),

              SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 80),
                    child: Text(
                      'Connected Devices:',
                      style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  // device count text from DB
                  Text(
                    '${snapshot.data.length} Devices', 
                    style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              
              SizedBox(height: 25,),
              
              Container(
                height: MediaQuery.of(context).size.height - 310,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.black45
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                )
              ),

            ]
          );

        }

      }
    );
  }
}
