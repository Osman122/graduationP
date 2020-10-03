import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation/api/register.dart';
import 'package:graduation/components/progress-dialog.dart';
import 'package:graduation/models/registermodel.dart';
import 'package:form_field_validator/form_field_validator.dart';


class Regester extends StatelessWidget {
  String username;
  String email;
  String phone;
  String password;
  String role;
  int active;
  bool card;
  String country;
  String city;
  String addressDet;
//ll
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Color(0xff2C3E50),
        body: ListView(
          padding: EdgeInsets.only(left: 25, right: 25, top: 80),
          children: <Widget>[
            Image(image: AssetImage("images/car1.png"),),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Row(children: <Widget>[
                Icon(Icons.person, size: 20, color: Color(0xffFFFFFF),),
                Text(" Personal information",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center),

              ]
              ),
            ),

            Padding(padding: EdgeInsets.only(bottom: 20),
              child: TextField(  controller:  new TextEditingController(),
                style: TextStyle(color: Colors.white),
                onChanged: (name){
                  username=name;
              },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Name',
                    icon: Icon(Icons.perm_identity, color: Color(0xff0984E3),
                      textDirection: TextDirection.rtl,),
                    hoverColor: Colors.white70
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller:  new TextEditingController(),
                onChanged: (mail){
                email=mail.trim();
              },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Email',
                    icon: Icon(Icons.email, color: Color(0xff0984E3),
                      textDirection: TextDirection.rtl,),
                    hoverColor: Colors.white70
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller:  new TextEditingController(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                maxLength: 11,
                onChanged: (phonee){
                phone=phonee;
              },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'phone',
                    icon: Icon(Icons.phone, color: Color(0xff0984E3),
                      textDirection: TextDirection.rtl,),
                    hoverColor: Colors.white70
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30),
              child: TextField(

                style: TextStyle(color: Colors.white),
                controller:  new TextEditingController(),
                obscureText: true,
                onChanged: (pass){
                password=pass;
              },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Password',
                    icon: Icon(Icons.lock, color: Color(0xff0984E3),
                      textDirection: TextDirection.rtl,),
                    hoverColor: Colors.white70
                ),
              ),
            )
            ,
            Divider(
              color: Colors.teal.shade100,
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Row(children: <Widget>[
                Icon(Icons.location_on, size: 20, color: Color(0xffFFFFFF),),
                Text(" Location information",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center),

              ]
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller:  new TextEditingController(),
                onChanged: (gover){country=gover;},
                decoration: InputDecoration(
                    hintStyle:
                    TextStyle(

                        color: Colors.grey, fontSize: 20),
                    hintText: "govern",
                    hoverColor: Color(0xff2C3E50),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller:  new TextEditingController(),
                onChanged: (c){city=c;},
                decoration: InputDecoration(
                    hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 20),
                    hintText: "city",
                    hoverColor: Color(0xff2C3E50),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(25)))),
              ),
            ),Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller:  new TextEditingController(),
                onChanged: (loca){addressDet=loca;},
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                    hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 20),
                    hintText: "detailed location",
                    hoverColor: Color(0xff2C3E50),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(25)))),
              ),
            ),
    SizedBox(height: 20),

            Card(
              color: Color(0xff3498DB),
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(50))),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
    onPressed:  ()async  {try{


/*
                  RegisterModel body =new RegisterModel();
                  Address a=new Address();
                  body.phone=phone;
                  body.email=email;
                  body.username=username;
                  body.password=password;
                  body.role="ROLE_USER";
                  body.active=1;
                  body.card= false;
               a.city=city;
              a.country=country;
               a.addressDet=addressDet;
                  print("sfsd");
                  print(a.city);*/

              await   StudentRegisterApi(context,username,email,phone,password,country,city,addressDet);
                }catch(e){print(e);}
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                color: Colors.blue,
                padding: EdgeInsets.only(
                    bottom: 15, top: 15, right: 100, left: 100),
              ),
            ),







          ]

        ),
      );
  }


}
