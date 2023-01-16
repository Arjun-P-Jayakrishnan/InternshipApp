import 'package:flutter/material.dart';
import 'package:manage_employee/Homepage/Employee/employee_task_list.dart';
import 'package:manage_employee/services/auth.dart';
import 'package:manage_employee/services/firebaseQueries.dart';
import 'package:provider/provider.dart';


















class Employee extends StatefulWidget {

  String name;
  Employee({required this.name});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {

  AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: employeeTaskQueries(name: widget.name).employeeTaskList,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.phone),onPressed: (){},),
            IconButton(icon: Icon(Icons.message),onPressed: (){},),
            IconButton(icon:Icon(Icons.dehaze),onPressed: () async{
              dynamic result=await _auth.signOut();
            },),
          ],
        ),
        body: EmployeeTaskList(),
      ),
    );
  }
}
