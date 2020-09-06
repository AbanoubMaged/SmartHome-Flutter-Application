import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_login/backend/DBService.dart';

class AddDeviceForm extends StatefulWidget {

  final String uid;
  AddDeviceForm({this.uid});

  @override
  _AddDeviceFormState createState() => _AddDeviceFormState();
}

class _AddDeviceFormState extends State<AddDeviceForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '', _did = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Add New Device',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 21,
                  fontWeight: FontWeight.w400),
            ),

            SizedBox(height: 40),//MediaQuery.of(context).size.height/21),

            TextFormField(
              validator: (nm) => nm.isEmpty ? 'Please Enter The Device Name' : null,
              onChanged: (nm) {
                setState(() => _name = nm);
              },

              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                
                labelText: 'Name',
                labelStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                hintText: 'enter device name',
                hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w200),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white30, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.cyan[700], width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.red[800], width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.red[700], width: 2),
                ),
              ),
            ),

            SizedBox(height: 20),//MediaQuery.of(context).size.height/4.9),

            TextFormField(
              validator: (did) => did.isEmpty ? 'Please Enter The Device ID' : null,
              onChanged: (did) {
                setState(() => _did = did);
              },

              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                
                labelText: 'Device ID',
                labelStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                hintText: 'enter device ID',
                hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w200),
                helperText: 'The device ID is written on the product',
                helperStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w200),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white30, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.cyan[700], width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.red[800], width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.red[700], width: 2),
                ),
              ),
            ),

            SizedBox(height: 40),

            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.cyan[700], //Color(0xff01A0C7),
              
              child: MaterialButton(
                splashColor: Colors.black12,
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                
                onPressed: () async {

                  if(_formKey.currentState.validate()) {

                    Navigator.of(context).pop();
                    await DatabaseService(uid: widget.uid).updateDeviceData(did: _did, name: _name);
                    Fluttertoast.showToast(msg: 'Device added successfully');

                    // try {
                    //   await DatabaseService(uid: widget.uid).updateDeviceData(did: _did, name: _name);
                    //   Navigator.pop(context);
                    //   Fluttertoast.showToast(msg: 'Device added successfully');
                    // } catch (e) {
                    //   Fluttertoast.showToast(msg: e);
                    // }

                  }

                },
                
                child: Text(
                  'Add Device',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
