import "package:flutter/material.dart";
import 'package:manage_employee/services/firebaseQueries.dart';
import 'package:manage_employee/shared/constants.dart';
















class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  final managerQueries _queries=managerQueries();

  final _formKey=GlobalKey<FormState>();

  String name="";
  String phone_no="";
  String email="";
  String username="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Add Employee"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Name"),
                validator: (val)=>val!.isEmpty?"Please enter a name":null,
                onChanged: (val){
                  setState(() {
                    name=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Phone No"),
                validator: (val)=>val!.isEmpty?"Please enter a phone no":null,
                onChanged: (val){
                  setState(() {
                    phone_no=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Email"),
                validator: (val)=>val!.isEmpty?"Please enter a email":null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Username"),
                validator: (val)=>val!.isEmpty?"Please enter a username":null,
                onChanged: (val){
                  setState(() {
                    username=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: textInputdecoration.copyWith(hintText: "Password"),
                validator: (val)=>val!.isEmpty?"Please enter a password":null,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(child: Text("Submit"),onPressed: () async{
                dynamic result=await _queries.addEmployeeData(name, phone_no, email, username, password);

                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),

    );
  }
}
