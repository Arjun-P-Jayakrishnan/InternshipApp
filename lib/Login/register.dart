import 'package:flutter/material.dart';
import 'package:manage_employee/services/auth.dart';
import 'package:manage_employee/shared/constants.dart';

import '../shared/loading.dart';


















class Register extends StatefulWidget {

  Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool loading=false;

  AuthService _auth=AuthService();

  final _formKey=GlobalKey<FormState>();

  String email="";
  String password="";
  String error="";

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(

     appBar: AppBar(
       actions: [IconButton(icon: Icon(Icons.person),onPressed: (){
         widget.toggleView();
       },)],
     ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(hintText: "Email"),
                  validator: (val)=>val!.isEmpty?"Enter a valid email":null,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(hintText: "Password"),
                  obscureText: true,
                  validator: (val)=>val!.isEmpty?"Enter a password 6+ long":null,
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton( child: Text("Sign Up"),onPressed: () async{
                  if(_formKey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });

                  }

                  dynamic result=await _auth.register(email, password);
                  if(result==null){
                    setState(() {
                      error="Please enter a valid email and password";
                      loading=false;
                    });
                  }
                },
                ),

                SizedBox(height: 20,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
