import 'dart:convert';
import 'package:graduation/Screens/Signup-errordialog.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:graduation/Screens/order_screen.dart';
import 'package:graduation/components/progress-dialog.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';


Future<String> MakeOrder(context,String Delivry_method,String vehiclename,String picuplocation,
    String mobile,String description,String reciver_name,int price,String Destination,int carnum,String Date) async {
  SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  ProgressDialog pr =new ProgressDialog(context);
  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
  pr.show();
  var response = await http.post(

      "https://alafyn20.herokuapp.com/orders/${sharedPreferences.getString(Common.email)}",
      headers: headers,
      body:jsonEncode(
      {
      "id":null,
      "delivery_method": Delivry_method,
      "vehicle_type": vehiclename,
      "pickup_Location": picuplocation,
      "mobile": mobile,
      "discription":description ,
      "client_name": reciver_name,
      "address": Destination,
      "price": price,

      "payment_method": "Cash",
      "time": Date,
      "car": carnum,
      "ok": false,
      "company": "",
      "done": false,

      "user":{

          "username": "",
          "email": " ",
          "phone": " ",
          "password": " ",
          "address": {
            "country": " ",
            "city": "  ",
            "addressDet": "    "
          },
          "role": "ROLE_USER",
          "active": 1,
          "card": false
        }
      }
      )
  );

  if (response.statusCode != 200 ||
      response.statusCode != 400 ||
      response.statusCode != 500) {

    print("ffffffffffff");
  }

  if (response.statusCode == 200) {




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
              errorMessage: "Your order wait for admin to admit it ", onpressed: () {
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