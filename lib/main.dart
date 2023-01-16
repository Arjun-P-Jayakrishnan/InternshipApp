import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manage_employee/services/auth.dart';
import 'package:manage_employee/models/user.dart';
import 'package:manage_employee/wrapper.dart';
import 'package:provider/provider.dart';












void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserObj?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


