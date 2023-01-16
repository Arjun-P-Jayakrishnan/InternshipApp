import 'package:flutter/material.dart';
import 'package:manage_employee/services/auth.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'employee.dart';
import 'Manager/manager.dart';


















class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AuthService _auth=AuthService();


  @override
  Widget build(BuildContext context) {

    final user=Provider.of<UserObj?>(context);
    print("user id ${user.toString()} isManager ${user!.isManager}");
    String username=user.isManager;
    int index=username.indexOf("@");
    print("username ${username.substring(0,index).trim()}");

    return user.isManager=="manager@company.com"?Manager():Employee(name:username.substring(0,index).trim());
  }
}
