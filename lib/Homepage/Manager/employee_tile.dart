import 'package:flutter/material.dart';
import 'package:manage_employee/Homepage/Employee/employee_task.dart';

import '../../models/employee.dart';

















class EmployeeTile extends StatelessWidget {

  Employee employee;
  String label;
  EmployeeTile({required this.employee,required this.label});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top:10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(employee.name,style: TextStyle(color: Colors.black),),
          trailing: ElevatedButton(child: Text(label),onPressed: (){
            if(label=="Task"){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>EmployeeTasks(employee: employee)));
            }
          },),
        ),
      ),
    );
  }
}











