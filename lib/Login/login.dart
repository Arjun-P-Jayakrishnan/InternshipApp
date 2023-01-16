import 'package:flutter/material.dart';
import 'package:manage_employee/Login/register.dart';
import 'package:manage_employee/Login/signIn.dart';














class Login extends StatefulWidget {


  static final String id="Login id";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _showSignedIn=true;

  void toggleView(){
    setState(() {
      _showSignedIn=!_showSignedIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(_showSignedIn){
      return SignIn(toggleView:toggleView);
    }
    else{
      return Register(toggleView:toggleView);
    }
  }
}
