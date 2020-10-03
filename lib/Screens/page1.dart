import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'signin.dart';



class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        color: Color(0xff2C3E50),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, bottom: 80),
              child: Image(image: AssetImage("images/car2.png")),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Card(
                    color: Color(0xff0984E3),
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Login();
                            }),
                          );
                        },
                        child: Text(
                          " Login with E_mail  ",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        padding: EdgeInsets.only(
                            bottom: 12, top: 12, right: 25, left: 25)),
                  ),
                  Card(
                    color: Colors.red,
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: FlatButton(
                        onPressed: null,
                        child: Text(
                          " Login with google  ",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        color: Colors.red,
                        padding: EdgeInsets.only(
                            bottom: 12, top: 12, right: 25, left: 25)),
                  ),
                  Card(
                    color: Color(0xff4267B2),
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    child: FlatButton(
                      onPressed: null,
                      child: Text(
                        "Login with Facebook",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      color: Color(0xff4267B2),
                      padding: EdgeInsets.only(
                          bottom: 12, top: 12, right: 25, left: 25),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "dont have an account?",
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  )
                ],
              ),
            )
          ],
        ),

    );
  }
}
