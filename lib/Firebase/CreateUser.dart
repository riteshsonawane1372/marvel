import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel/utilits/toast.dart';


class Users{

  final String Email;
  final String Password;

  Users({
    required this.Email,
    required this.Password
});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CreateUser(){

    try{
      final UserCredentials =_auth.createUserWithEmailAndPassword(
          email: Email,
          password: Password);
    } on FirebaseAuthException
    catch(e){
      if(e.code=='weak-password'){
       return ReponseToast(showMessage: "${e.code}").Message();
      }
      else if (e.code=='email-already-in-use') return ReponseToast(showMessage: e.code).Message();
      else{
        return ReponseToast(showMessage: e.code).Message();
      }
    }


  }

}