import 'package:flutter/material.dart';
import 'package:manage_employee/services/firebaseQueries.dart';
import 'package:manage_employee/shared/constants.dart';


















class AddEmployeeTask extends StatefulWidget {

  String name;
  AddEmployeeTask({required this.name});

  @override
  State<AddEmployeeTask> createState() => _AddEmployeeTaskState();
}

class _AddEmployeeTaskState extends State<AddEmployeeTask> {


  final _formKey=GlobalKey<FormState>();

  String task_title="";
  int task_no=0;
  String task_date="";
  String task_details="";

  @override
  Widget build(BuildContext context) {
    employeeTaskQueries _queries=employeeTaskQueries(name:widget.name);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Add Task"),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(hintText: "Title"),
                  validator: (val)=>val!.isEmpty?"Please Enter a title":null,
                  onChanged: (val){
                    setState(() {
                      task_title=val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(hintText: "Task No"),
                  validator: (val)=>val!.isEmpty?"Please enter task no":null,
                  onChanged: (val){
                    setState(() {
                      task_no=int.parse(val);
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(hintText: "Task Date"),
                  validator: (val)=>val!.isEmpty?"Please Enter a date":null,
                  onChanged: (val){
                    setState(() {
                      task_date=val;
                    });
                  }
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputdecoration.copyWith(hintText: "Task Details"),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 2,
                  validator: (val)=>val!.isEmpty?"Please enter the details":null,
                  onChanged: (val){
                    setState(() {
                      task_details=val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(child: Text("Save"),onPressed: () async{
                  dynamic result=await _queries.addEmployeeTaskData(widget.name,task_title, task_no, task_date, task_details);
                  print("result ${result}");

                }, )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
