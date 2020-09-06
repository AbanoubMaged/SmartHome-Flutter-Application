import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SpinKitRipple(
              color: Colors.cyan[700],
              size: 100.0,
            ),
          ),
        
          SizedBox(height: 50),
        
          Text('Loading...',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyan[700],
          fontSize: 20,
          fontWeight: FontWeight.w300),
          ),
        ] 
      ),
    );
  }
}