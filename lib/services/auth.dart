import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

import '../models/user.dart';













class AuthService{

  FirebaseAuth _auth=FirebaseAuth.instance;

  //object conversion
  UserObj? _userFromAutherization(User? user){

    return user!=null?UserObj(uid:user.uid,isManager: user.email??""):null;
  }


  //stream
  Stream<UserObj?> get user{
    return _auth.authStateChanges().map((user){
      print("Autherization ${user.toString()}");
      return _userFromAutherization(user);});

  }

  //signin

  Future signIn (String email,String password) async{
    try{
      UserCredential _result=await _auth.signInWithEmailAndPassword(email: email, password: password) ;
      User? user=_result.user;
      return _userFromAutherization(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }



  //register
  Future register(String email,String password) async{
    try{
      UserCredential _result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=_result.user;
      return _userFromAutherization(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();

    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}

