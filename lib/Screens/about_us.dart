import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2C3E50),
        elevation: 0.00,
      ),
      backgroundColor: Color(0xff2C3E50),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(child: Image.asset("images/carpic.png"),),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("were to go \n(the World between your hand)",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color:Colors.black),),
        ),
          Text("(Our Team)",style: TextStyle(fontSize: 25,color: Colors.white),),
          SizedBox(height: 10,),
          Text("Osman Ahmed Abdelmoneam",style: TextStyle(fontSize: 25,color: Colors.white),),
          Text("Amr Mamdouh Nouh",style: TextStyle(fontSize: 25,color: Colors.white),),
          Text("Karim Maged",style: TextStyle(fontSize: 25,color: Colors.white),),
          Text("Amr Khaled Elsebaey",style: TextStyle(fontSize: 25,color: Colors.white),),

          Text("Ahmed Zaid",style: TextStyle(fontSize: 25,color: Colors.white),),

      ],),
    );
  }
}
