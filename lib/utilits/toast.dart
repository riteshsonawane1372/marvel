import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ReponseToast{

  final String showMessage;

  ReponseToast({
    required this.showMessage
});

  Message() {
    (BuildContext context) {
      return Fluttertoast.showToast(
        msg: showMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  };
  }

}


