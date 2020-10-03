import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Screens/Splash.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {


return MaterialApp(
    home: Splash());

}}
