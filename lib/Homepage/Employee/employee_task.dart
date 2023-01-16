import 'package:flutter/material.dart';
import 'package:manage_employee/Homepage/Employee/employee_task_list.dart';
import 'package:manage_employee/Homepage/Employee/add_employee_task.dart';
import 'package:manage_employee/services/firebaseQueries.dart';
import 'package:provider/provider.dart';

import '../../models/employee.dart';



















class EmployeeTasks extends StatefulWidget {

  Employee employee;
  EmployeeTasks({required this.employee});

  @override
  State<EmployeeTasks> createState() => _EmployeeTasksState();
}

class _EmployeeTasksState extends State<EmployeeTasks> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: employeeTaskQueries(name:widget.employee.name).employeeTaskList,
      child: Scaffold(


        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_sharp),onPressed: (){
            Navigator.pop(context);
          },),
          toolbarHeight: 200.0,
          title:Text(widget.employee.name),
          actions: [
            IconButton(icon:Icon(Icons.call),onPressed: (){},),
            IconButton(icon:Icon(Icons.message_sharp),onPressed: (){},)
          ],
          bottom: PreferredSize(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [
                Row(children: [Icon(Icons.person),Text(widget.employee.name),]),
                Row(children: [Icon(Icons.call),Text(widget.employee.phone_no)],),
                Row(children: [Icon(Icons.mail),Text(widget.employee.email)],),
                SizedBox(width:double.maxFinite,child: ElevatedButton(child:Text("Add Task"),onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>AddEmployeeTask(name:widget.employee.name)));
                }, ))
              ],
            ),
          ), preferredSize: Size.fromHeight(20)),

        ),

        body:EmployeeTaskList(),

      ),
    );
  }
}
