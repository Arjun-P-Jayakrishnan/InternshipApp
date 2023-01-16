import 'package:flutter/material.dart';
import 'package:manage_employee/models/user.dart';
import 'package:provider/provider.dart';

import 'Homepage/homepage.dart';
import 'Login/login.dart';















class Wrapper extends StatelessWidget {
  var id=Login.id;

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<UserObj?>(context);

    if(user==null){
      return Login();
    }
    else{
      return Homepage();
    }
  }
}
