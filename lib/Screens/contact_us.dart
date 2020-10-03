


import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2C3E50),
        elevation: 0.00,
      ),
      backgroundColor: Color(0xff2C3E50),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(margin: EdgeInsets.all(20),
            child: Image.asset("images/carpic.png"),),

          Text("Our Phone",style: TextStyle(fontSize: 25,color: Colors.white),),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30,
                  color: Colors.blue,
                ),
                title: Text(
                  "+010 25314161",
                  style: TextStyle(fontSize: 25),

                ),
              ),
            ),
          ),
          Text("Our E-Mail",style: TextStyle(fontSize: 25,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.blue,
                ),
                title: Text(
                  "Team_alafen@Gmail.com",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          Text("Our place",style: TextStyle(fontSize: 25,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.add_location,
                  size: 30,
                  color: Colors.blue,
                ),
                title: Text(
                  "Faculty of Computer and Information , Menofia University .",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          )





        ],
      ),
    );
  }
}
