import 'package:flutter/material.dart';
import 'package:manage_employee/Homepage/Employee/add_employee_task.dart';
import 'package:manage_employee/Homepage/Manager/employee_list.dart';
import 'package:manage_employee/Homepage/Manager/employee_tile.dart';
import 'package:manage_employee/services/auth.dart';
import 'package:manage_employee/services/firebaseQueries.dart';
import 'package:provider/provider.dart';

import '../../shared/constants.dart';
import 'add_employee.dart';

















class Manager extends StatefulWidget {
  const Manager({Key? key}) : super(key: key);

  @override
  State<Manager> createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {

  AuthService _auth=AuthService();
  List<String> _popUpOptions=["Call CEO","Add Employee","Payment","Log Out"];

  void choiceAction(String choiceOption) async{
    print(choiceOption);
    if(choiceOption=="Log Out"){
      dynamic result=await _auth.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: managerQueries().employeeList,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar:AppBar(
            title: Column(
              children: [
                SizedBox(height: 25,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(prefixIcon: Icon(Icons.search)),
                ),
                Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text("Add Employee+"),onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AddEmployee()));
                  },),
                )
              ],
            ),
            toolbarHeight: 150.0,
            actions: [
              IconButton(icon: Icon(Icons.message_sharp),onPressed: (){},),
              PopupMenuButton<String>(
                  onSelected: choiceAction,
                  itemBuilder: (context){
                    return _popUpOptions.map((String PopUp_option){
                      return PopupMenuItem<String>(
                        value: PopUp_option,
                        child: Text(PopUp_option),
                      );
                    }).toList();
                  }
                  )
            ],
            bottom:TabBar(
              tabs: [
                Tab(icon: Text("Employees"),),
                Tab(icon: Text("Task"),)
              ],
            ),
          ),

          body:TabBarView(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    EmployeeList(tab: "Employees"),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    EmployeeList(tab: "Task"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
