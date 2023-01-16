
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manage_employee/models/employee.dart';



















class recordQueries{

  String uid;
  final String email;
  recordQueries({required this.uid,required this.email});

  final CollectionReference employeeRef=FirebaseFirestore.instance.collection("manager");

      EmployeeTask _userDataFromDatabase(DocumentSnapshot snapshot){

          String _employeeDataJSON=jsonEncode(snapshot);
          Map<String,dynamic> _employeeData=jsonDecode(_employeeDataJSON);

          return EmployeeTask(
              task_title: _employeeData["task_title"],
              task_no: _employeeData["task_no"],
              task_date: _employeeData["task_date"],
              task_details: _employeeData["task_details"]
          );

      }



      Stream<EmployeeTask> get employeeData{
        return employeeRef.doc(uid).snapshots().map(_userDataFromDatabase);
      }


}

class employeeTaskQueries{

  String name;
  employeeTaskQueries({required this.name});

  final CollectionReference employeeTaskRef=FirebaseFirestore.instance.collection("employee");

  List<EmployeeTask> _employeeTaskListFromDatabase(QuerySnapshot snapshot){

    return snapshot.docs.map((employeeSnapshot){
      String _employeeTaskJSON=jsonEncode(employeeSnapshot.data());
      print("JSON ${_employeeTaskJSON}");
      Map<String,dynamic> _employee=jsonDecode(_employeeTaskJSON);

      return EmployeeTask(task_title: _employee["task_title"]??"", task_no: _employee["task_no"]??"", task_date: _employee["task_date"]??"", task_details: _employee["task_details"]??"");
    }).toList();

  }

  Stream<List<EmployeeTask>> get employeeTaskList{
    return employeeTaskRef.doc(name).collection("tasks").snapshots().map(_employeeTaskListFromDatabase);
  }

  Future addEmployeeTaskData(String name,String task_title,int task_no,String task_date,String task_details) async{

    return await employeeTaskRef.doc(name).collection("tasks").doc(task_title).set({
      'task_title':task_title,
      'task_no':task_no,
      'task_date':task_date,
      'task_details':task_details,
    });

  }

}

class managerQueries {

  final CollectionReference employeeRef = FirebaseFirestore.instance.collection(
      "manager");

  List<Employee> _employeeListFromDatabase(QuerySnapshot snapshot) {
    return snapshot.docs.map((employee) {
      String _employeeJSON = jsonEncode(employee.data());
      print("_employee data ${_employeeJSON}");
      Map<String, dynamic> _employee = jsonDecode(_employeeJSON);

      return Employee(
          name: _employee["name"] ?? "",
          phone_no: _employee["phone_no"] ?? "",
          email: _employee["email"] ?? "",
          username: _employee["username"] ?? "",
          password: _employee["password"] ?? "");
    }).toList();
  }


  Stream<List<Employee>> get employeeList{
    return employeeRef.snapshots().map(_employeeListFromDatabase);
  }



  Future addEmployeeData(String name,String phone_no,String email,String username,String password) async{

    return employeeRef.doc(username).set({
      "name":name,
      "phone_no":phone_no,
      "email":email,
      "username":username,
      "password":password,
    });

  }

}

