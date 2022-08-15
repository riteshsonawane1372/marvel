import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ApiData {
  String URL ="https://mcuapi.herokuapp.com/api/v1/movies";
  List Data =[];
 Future <dynamic> getData() async{
    var client = http.Client();
    var APIURI = Uri.parse(URL);
    var res = await client.get(APIURI);
    var jsonData=jsonDecode(res.body);
    return jsonData["data"];

  }


}