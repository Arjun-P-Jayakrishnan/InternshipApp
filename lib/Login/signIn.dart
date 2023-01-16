import 'package:flutter/material.dart';
import 'package:manage_employee/services/auth.dart';
import 'package:manage_employee/shared/constants.dart';

import '../shared/loading.dart';















class SignIn extends StatefulWidget {

  Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();

  final _formKey=GlobalKey<FormState>();

  bool loading=false;

  String email="";
  String password="";
  String error="";

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){widget.toggleView();}, icon: Icon(Icons.person_add))],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                    decoration: textInputdecoration.copyWith(hintText: "Email"),
                    validator: (val)=>val!.isEmpty?"Please enter a valid email":null,
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
                  validator: (val)=>val!.length<6?"Please enter a password 6+ long":null,
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(child: Text("Sign In"),onPressed: () async{

                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading=true;
                    }

                    );

                  }


                    dynamic result=await _auth.signIn(email, password);

                    if(result==null){
                      setState(() {
                        error="Could not log in with those credentials";
                        loading=false;
                      });
                    }
                    }
                 ),
                SizedBox(height: 20,),
                Text(error,style: TextStyle(
                  color: Colors.red,fontSize: 15,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
