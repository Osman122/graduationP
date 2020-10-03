
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/api/Signin.dart';

import 'homescreen.dart';
import 'regester.dart';

class Login extends StatelessWidget {
  String email,pass;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(30),
          color: Color(0xff2C3E50),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 60, bottom: 60),
                child: Image(image: AssetImage("images/car1.png")),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextField(onChanged: (y){email=y.trim();},
                         style: TextStyle(color: Colors.white),
                controller:  new TextEditingController(),

                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                            hintText: 'E-Mail',
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                              textDirection: TextDirection.rtl,
                            ),
                            hoverColor: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextField(obscureText: true,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                        controller:  new TextEditingController(),
                        onChanged: (x){pass=x;},
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                            hintText: 'Password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                              textDirection: TextDirection.rtl,
                            ),
                            hoverColor: Colors.white70),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Forget your passweord?",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      onPressed: null,
                    ),
                    Card(
                      color: Color(0xff3498DB),
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                               BorderRadius.all(Radius.circular(50))),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        onPressed: (){
                           SignIn(context, email, pass);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.only(
                            bottom: 15, top: 15, right: 100, left: 100),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "dont have an account?",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Regester();
                          }),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
