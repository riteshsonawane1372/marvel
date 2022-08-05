import 'package:flutter/material.dart';


class TextfieldforAPP extends StatelessWidget {


  final TextEditingController textController;
  final String hintText;
  bool isObsured;

  TextfieldforAPP({
    required this.textController,
    required this.hintText,
    required this.isObsured

  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsured,
      cursorColor: Color.fromRGBO(0, 0, 0, 1),
      controller: textController,
      decoration: InputDecoration(
          hintText: "${hintText}",
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 0, 0,2)
      ),
    );
  }
}