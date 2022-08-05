import 'package:flutter/material.dart';
import 'package:marvel/Responsive/Responisve.dart';
import 'package:marvel/Screens/LoginScreen.dart';
import 'package:marvel/Responsive/MobileScreen.dart';
import 'package:marvel/Responsive/WebScreen.dart';

void main() {
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
    return LoginScreen();
  }
}


