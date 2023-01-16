import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/employee.dart';
import 'employee_tile.dart';

















class EmployeeList extends StatefulWidget {
  String tab;
  EmployeeList({required this.tab});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {

    final employees=Provider.of<List<Employee>?>(context)??[];

    employees.forEach((employee) {
      print(employee.name);
      print(employee.phone_no);
      print(employee.email);
      print(employee.username);
      print(employee.password);
    });

    return ListView.builder(
        shrinkWrap: true,
        itemCount: employees.length,
        itemBuilder:(context,index){
          return EmployeeTile(employee:employees[index],label:widget.tab=="Employees"?"Invite":"Task");
        }
    );
  }
}
