import 'package:flutter/material.dart';
import 'package:manage_employee/models/employee.dart';
import 'package:provider/provider.dart';

import 'employee_task_tile.dart';


















class EmployeeTaskList extends StatefulWidget {

  @override
  State<EmployeeTaskList> createState() => _EmployeeTaskListState();
}

class _EmployeeTaskListState extends State<EmployeeTaskList> {
  @override
  Widget build(BuildContext context) {

    final _employeeTasks=Provider.of<List<EmployeeTask>?>(context)??[];


    return ListView.builder(
        itemCount: _employeeTasks.length,
        itemBuilder:(context,index){

          return EmployeeTaskTile(employeeTask:_employeeTasks[index]);
        });
  }
}
