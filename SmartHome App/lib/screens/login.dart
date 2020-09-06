import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_login/classes/user.dart';
import 'package:simple_login/backend/AuthService.dart';
import 'package:simple_login/screens/loading.dart';

class LoginScreen extends StatefulWidget {

  final Function toggleView;
  LoginScreen({ this.toggleView });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _email = '';
  String _password = '';
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  AuthService _authService =  AuthService();

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold(

      backgroundColor: Colors.blueGrey[900],
      
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black26,
          padding: EdgeInsets.all(30),

          child: Form(
            key: _formKey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                SizedBox(height: 16.0),

                Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white70,//blueGrey[100],
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                SizedBox(height: 55.0),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (un) => un.isEmpty || !un.contains("@") || !un.contains(".com") || un.contains(" ") ? "Please Enter a Valid Email" : null,
                  onChanged: (un) {
                    setState(() => _email = un);
                  },

                  style: TextStyle(fontSize: 20.0, color: Colors.blueGrey[100]),

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(25.0, 17.0, 20.0, 17.0),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w300),
                      hintText: 'example@something.com',
                      hintStyle: TextStyle(color: Colors.white54, fontSize: 11, fontWeight: FontWeight.w300),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.cyan[700], width: 2),
                      ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Colors.red[800], width: 1),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Colors.red[700], width: 2),
                    ),
                  ),
                ),

                SizedBox(height: 20.0),

                TextFormField(
                  validator: (pwd) => pwd.isEmpty ? "Please Enter a Password" : null,
                  onChanged: (pwd) {
                   setState(() => _password = pwd);
                  },
                  obscureText: true,
                  style: TextStyle(fontSize: 20.0, color: Colors.blueGrey[100]),

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(25.0, 17.0, 20.0, 17.0),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w300),
                      hintText: 'enter a password',
                      hintStyle: TextStyle(color: Colors.white54, fontSize: 11, fontWeight: FontWeight.w300),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Colors.white30, width: 1),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Colors.cyan[700], width: 2),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Colors.red[800], width: 1),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Colors.red[700], width: 2),
                    ),
                  ),
                ),

                SizedBox(height: 45.0),

                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.cyan[700], //Color(0xff01A0C7),

                  child: MaterialButton(
                    splashColor: Colors.black12,
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                    onPressed: () async {

                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        // firebase login
                        User result = await _authService.signInWithEmailAndPassword(_email, _password);
                        
                        if(result != null) {
                          Fluttertoast.showToast(msg: 'Login Successful');
                        } else {
                          Fluttertoast.showToast(msg: 'Login Failed');
                          setState(() => loading = false);
                        }
                      } else {
                        Fluttertoast.showToast(msg: 'Please Enter a Valid Email and Password');
                      }
                    },

                    child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400
                        )
                    ),
                  ),
                ),

                SizedBox(height: 30.0),

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('OR', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
                    ],
                    ),
                ),

                SizedBox(height: 10.0),

                FlatButton.icon(
                    icon: Icon(Icons.person_add, color: Colors.cyan[700],),
                    label: Text('Register', style: TextStyle(color: Colors.cyan[700], fontWeight: FontWeight.w400),),
                    onPressed: () => widget.toggleView()
                    ),
                
                SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}