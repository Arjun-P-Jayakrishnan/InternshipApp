import 'package:flutter/material.dart';

import '../../models/employee.dart';

















class EmployeeTaskTile extends StatelessWidget {

  EmployeeTask employeeTask;
  EmployeeTaskTile({required this.employeeTask});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:20),
    child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        title: Text(employeeTask.task_title),
      ),
    ),
    );
  }
}
