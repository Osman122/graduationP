import 'dart:convert';
import 'package:graduation/Screens/Signup-errordialog.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:graduation/components/progress-dialog.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';


Future<String> StudentRegisterApi(context,String username,String email,String phone,String pass,String country,String city,String adress) async {
ProgressDialog pr =new ProgressDialog(context);
  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
pr.show();
  var response = await http.post(
    "https://alafyn20.herokuapp.com/users/reg",
    headers: headers,
    body:jsonEncode( {

      "username": username,
      "email": email,
      "phone": phone,
      "password":pass ,
      "address": {
        "country": country,
        "city": city,
        "addressDet": adress
      },
      "role": "ROLE_USER",
      "active": 1,
      "card": false
    })
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
    sharedPreferences.setString(Common.addressDet, data["addressDet"]);
    print(sharedPreferences.getString(Common.addressDet));


    pr.hide();

showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        backgroundColor: Colors.transparent,
        child: ErrorSignUpWidget(
          errorMessage: "press ok if you want to auto LogIn", onpressed: () {
            Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));

        },),
      );
    } );

    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    print(response.body);


    return response.body;
  } else if (response.statusCode == 415) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            backgroundColor: Colors.transparent,
            child: ErrorSignUpWidget(
              errorMessage: "please check your data and retry", onpressed: () {
              Navigator.pop(context);

            },),
          );
        } );
pr.hide();
    throw Exception('Failed to Submit Data444');
  } else {
    pr.hide();
    print(response.statusCode);
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            backgroundColor: Colors.transparent,
            child: ErrorSignUpWidget(
              errorMessage: "chech you data and try again", onpressed: () {
              Navigator.pop(context);

            },),
          );
        } );







  }
}