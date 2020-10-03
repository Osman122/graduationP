import 'dart:convert';



import 'package:graduation/Screens/Signup-errordialog.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:graduation/components/progress-dialog.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';


Future<String> GetUser(String email) async {

  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

  var response = await http.get(
      "https://alafyn20.herokuapp.com/users/$email",
      headers: headers,

  );

  if (response.statusCode != 200 ||
      response.statusCode != 400 ||
      response.statusCode != 500) {

    print("ffffffffffff");
  }

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    sharedPreferences.setString(Common.name, data["username"]);

    sharedPreferences.setString(Common.email, data["email"]);
    sharedPreferences.setString(Common.phone, data["phone"]);
    sharedPreferences.setString(Common.addressDet, data["address"]["addressDet"]);
    print(sharedPreferences.getString(Common.addressDet+"ooooooooo"));

    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    print(response.body);


    return response.body;
  } else if (response.statusCode == 415) {

    throw Exception('Failed to Submit Data444');
  } else {

    print(response.statusCode);

    throw Exception('Failed to Submit Dataaaaa5');






  }
}