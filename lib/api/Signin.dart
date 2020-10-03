import 'dart:convert';



import 'package:graduation/Screens/Signup-errordialog.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:graduation/api/getuser.dart';
import 'package:graduation/components/progress-dialog.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';


Future<String> SignIn(context,String email,String pass) async {
  ProgressDialog pr =new ProgressDialog(context);
  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
  pr.show();
  var response = await http.post(
      "https://alafyn20.herokuapp.com/sigin",
      headers: headers,
      body:jsonEncode( {


        "username": email,

        "password":pass ,
      })
  );

  if (response.statusCode != 200 ||
      response.statusCode != 400 ||
      response.statusCode != 500) {

    print("ffffffffffff");
  }

  if (response.statusCode == 200) {
    var data = json.decode(response.body);


 await GetUser(email);

    pr.hide();


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));




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
              errorMessage: "please check your data and retry", onpressed: () {
              Navigator.pop(context);

            },),
          );
        } );
    throw Exception('Failed to Submit Dataaaaa5');






  }
}