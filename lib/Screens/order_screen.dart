import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Screens/homescreen.dart';
import 'package:graduation/api/GetOrdrs.dart';
import 'package:graduation/api/MakeOrder.dart';
import 'package:graduation/models/orderrecive.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class OrderScreen extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<OrderScreen> {

String picuplocation,destnation,recivername,reciverphone;
String description;
  int carnum = 1 ;
  int _currentStep = 0;
  String date;
  int price;
  int calculateprice(String method,int cars){
  int x =20*cars;
  if(method=="Delivery&recive")
    x=x*2;
  return x;}
  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<provid>(context);
    String method = bloc.method;
    String car = bloc.car;





    return Scaffold(
      backgroundColor: Color(0xff2C3E50),
      appBar:  AppBar(
        title:  Text('3la feen'),centerTitle: true,
        backgroundColor: Color(0xff2C3E50),
        elevation: 0,
      ),
      body: Align(
        child: Theme(
          data: ThemeData(
              primaryColor: Color(0xff00B398),
              canvasColor: Color(0xff2C3E50),
              focusColor: Colors.white),
          child: new Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepTapped: (int step) => setState(() => _currentStep = step),
            onStepContinue: _currentStep < 2
                ? () => setState(() => _currentStep += 1)
                : null,
            onStepCancel: _currentStep > 0
                ? () => setState(() => _currentStep -= 1)
                : null,
            steps: <Step>[
              new Step(
                title: new Text(''),
                content: new Theme(
                    data: ThemeData(focusColor: Colors.white),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:  Color(0xff00B398),
                              radius: 25,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                 if(carnum>=2)
                                    carnum--;
                                  });
                                },
                                child: Icon(Icons.minimize,size: 22,),
                              ),
                            ),
                            SizedBox(width: 40,),
                            CircleAvatar(
                              backgroundColor: Color(0xff00B398) ,
                              radius: 25,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if(carnum<5)
                                    carnum++;
                                  });
                                },
                                child: Icon(Icons.add,size: 22,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),

                        Text("The Number Of Cars $carnum",style: TextStyle(fontSize: 25,color: Colors.white),),
                        SizedBox(height: 20,),


                        RaisedButton(
                          child: Text("Choose Date",style: TextStyle(fontSize: 25),),
                          onPressed: () async {
                            var datePicked = await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime(2020),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2022),
                              dateFormat: "yyyy-MM-dd",
                              locale: DateTimePickerLocale.en_us,
                              looping: true,
                            );
                            final DateFormat formatter = DateFormat('yyyy-MM-dd');
                            final String formatted = formatter.format(datePicked);
                          print(formatted);
                          date=formatted;
                      /* DateTime x= datePicked;
                           print(datePicked);
                           date=datePicked.toIso8601String();
                           print(date);*/
                          },
                        ),
                        SizedBox(height: 20,),


                      ],
                    )
                ),
                isActive: _currentStep >= 0,
                state: _currentStep >= 0
                    ? StepState.complete
                    : StepState.disabled,
              ),
              new Step(
                title: new Text(''),
                content: new SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 22,
                          ),
                          Text(
                            "  pickup location",
                            style:
                            TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller:  new TextEditingController(),
                          onChanged: (x){
                            picuplocation=x;

                          },
                          decoration: InputDecoration(
                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                              hintText: "pickup location",
                              hoverColor: Color(0xff2C3E50),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 22,
                          ),
                          Text(
                            "  destination location",
                            style:
                            TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (x){
                            destnation=x;

                          },
                          decoration: InputDecoration(

                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                              hintText: "destination location",
                              hoverColor: Color(0xff2C3E50),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                        ),
                      ),


                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                            size: 22,
                          ),
                          Text(
                            "Reciver Data",
                            style:
                            TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (x){recivername=x;},
                          decoration: InputDecoration(
                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                              hintText: "Reciver Name",
                              hoverColor: Color(0xff2C3E50),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (x){reciverphone=x;},
                          decoration: InputDecoration(
                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                              hintText: "Reciver Phone",
                              hoverColor: Color(0xff2C3E50),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                        ),
                      )

                    ],
                  ),
                ),
                isActive: _currentStep >= 0,
                state: _currentStep >= 1
                    ? StepState.complete
                    : StepState.disabled,
              ),
              new Step(
                title: new Text(''),
                content: new Column(
                  children: <Widget>[
                    Container(decoration: BoxDecoration( color:Color(0xffD6E7E4),borderRadius:BorderRadius.all(Radius.circular(30))),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                        child: SizedBox(height: 130,
                          child: Center(
                            child: Text(
                              "${calculateprice(method, carnum)} EGP per KM",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: RadioButtonGroup(
                        labelStyle:
                        TextStyle(fontSize: 18, color: Colors.white),
                        labels: ["cash"],
                      ),
                      trailing: Icon(Icons.monetization_on),
                    )
            , Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(keyboardType: TextInputType.multiline,

                        onChanged: (x){description=x;},
                        decoration: InputDecoration(
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 18),
                            hintText: "Description of you staff",
                            hoverColor: Color(0xff2C3E50),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                      child: SizedBox(height: 60,
                        child: RaisedButton(onPressed: (){
                          print(method);
                          print(car);
                          MakeOrder(context, method, car, picuplocation, reciverphone, description  , recivername, calculateprice(method, carnum), destnation, carnum, date);
                        },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          color: Color(0xffD6E7E4),
                          child: Text(" Confirm Order ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                      ),
                    )


                  ],
                ),
                isActive: _currentStep >= 0,
                state: _currentStep >= 2
                    ? StepState.complete
                    : StepState.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}