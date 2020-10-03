import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:graduation/Screens/signin.dart';
import 'package:graduation/api/getuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';
import 'order_screen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckUser() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      print(sharedPreferences.getString("ooooooo"));
      if (sharedPreferences.getString(Common.name) == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Login()));
      } else {
        GetUser(sharedPreferences.getString(Common.email));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return new HomeScreen();
          }),
        );
      }
      print(sharedPreferences.getString(Common.name));
    }

    Timer(Duration(seconds: 5), () {
      CheckUser();
    });

    return MaterialApp(
        home: Container(
      color: Color(0xff2C3E50),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Image(
          image: AssetImage("images/car1.png"),
          fit: BoxFit.scaleDown,
        ),
      ),
    ));
  }
}
