import 'package:flutter/material.dart';

class MyMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C3E50),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 150,
              child: Image.asset("images/money.png"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "There is No Money",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
