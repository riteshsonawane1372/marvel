import 'package:flutter/material.dart';
import 'package:marvel/Responsive/Responisve.dart';
import 'package:marvel/Screens/HomScreen.dart';
import 'package:marvel/Screens/LoginScreen.dart';
import 'package:marvel/Responsive/MobileScreen.dart';
import 'package:marvel/Responsive/WebScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marvel/utilits/BoxContainer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 1)
    ),
    home: Marvel(),
  ));
}

class Marvel extends StatelessWidget {
  const Marvel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}


