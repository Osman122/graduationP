import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:graduation/Common.dart';
import 'package:graduation/Screens/about_us.dart';
import 'package:graduation/Screens/contact_us.dart';
import 'package:graduation/Screens/profile_screen.dart';
import 'package:graduation/Screens/signin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_deliveres_screen.dart';
import 'my_money_screen.dart';
import 'order_screen.dart';


const activecolor = Color(0xffD6E7E4);
const inactivecolor = Colors.grey;
enum Gender { deliver , receive}

class HomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return
       MultiProvider(
         providers: [ChangeNotifierProvider(create: (_) =>provid() ,)],
         child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xff2C3E50),
                    elevation: 0.00,
                  ),
                  drawer: Drawer1(),

                  backgroundColor: Color(0xff2C3E50),
                  body:  PageView(
                    controller: _pageController,
                    children: <Widget>[
                      MyDelivers()
                      ,
                      HomeBody(),

                      MyMoney()
                    ],
                  ),bottomNavigationBar: CustomBottomNavigationBar(
              items: [
                CustomBottomNavigationBarItem(
                  icon: Icons.map,
                  title: "My Delivires",
                ),
                CustomBottomNavigationBarItem(
                  icon: Icons.directions_car,
                  title: "Deliver Now",
                ),
                CustomBottomNavigationBarItem(
                  icon: Icons.monetization_on,
                  title: "My Money",
                ),
              ],

              onTap: (index) {
                _pageController.animateToPage(index,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(milliseconds: 600));
              },
            ),),
          ),
      ),
       );


  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Gender selectedgender ;
  String Sellected;


  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<provid>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bloc.ubdatemetod("Delivery&recive");
                      Sellected="";
                      selectedgender = Gender.receive;
                    });
                  },
                  child: Container(
                    height: 130,
                    margin: EdgeInsets.only(
                        top: 30, bottom: 30, right: 30, left: 40),
                    decoration: BoxDecoration(
                        color: selectedgender == Gender.receive ? activecolor : inactivecolor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Image(
                                image: AssetImage("images/one.png"))),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Deliver&Recive",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bloc.ubdatemetod("Delivery");
                      Sellected="Delivery";
                      selectedgender = Gender.deliver;
                    });
                  },
                  child: Container(
                      height: 130,
                      margin: EdgeInsets.only(
                          top: 30, bottom: 30, right: 40, left: 30),
                      decoration: BoxDecoration(

                          color: selectedgender == Gender.deliver ? activecolor : inactivecolor,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Image(
                                  image: AssetImage("images/one.png"))),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Deliver",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/town.png"),
                  fit: BoxFit.contain)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: DropDownCars(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: SizedBox(height: 60,
            child: RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OrderScreen()));
            },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              color: Color(0xffD6E7E4),
              child: Text("Order Now",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
          ),
        )
      ],
    );
  }
}
class provid extends ChangeNotifier{
  String method;
String car;

ubdatemetod(String x){
  method=x;
  notifyListeners();

}
  ubdatecar(String z){
    car=z;
    notifyListeners();

  }

}





class Drawer1 extends StatefulWidget {


  @override
  _Drawer1State createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {



  @override
  Widget build(BuildContext context) {

    GlobalKey<AsyncLoaderState> asyncloadername =
    GlobalKey<AsyncLoaderState>();
    var asyncLoader = AsyncLoader(
      key: asyncloadername,
      initState: () async => await Common.getusername(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Text(error),
      renderSuccess: ({data}) => Text(data),
    );


    GlobalKey<AsyncLoaderState> asyncloaderad =
    GlobalKey<AsyncLoaderState>();
    var asyncLoaderadress = AsyncLoader(
      key: asyncloaderad,
      initState: () async => await Common.getadress(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Text(error),
      renderSuccess: ({data}) => Text(
        data,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white),
      ),
    );


    return  Drawer(
        child: Container(
          color: Color(0xff2C3E50),
          margin: EdgeInsets.only(top: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 25, bottom: 25),
                  color: Color(0xff00B398),
                  child: ListTile(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfileScreen()));
                  },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/user.png"),
                      backgroundColor: Colors.black,
                    ),
                    title:
                      asyncLoader



                    ,
                    subtitle:
                   asyncLoaderadress),
                ),
                SizedBox(height: 40),

                FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfileScreen()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: Text(
                      "My Profile",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyMoney()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: Text(
                      "My Money",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),

                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ContactUs()));
                },
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_in_talk,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Contact Us",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AboutUs()));
                },
                  child: ListTile(
                    leading: Icon(
                      Icons.live_help,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: Text(
                      "About Us",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),
                FlatButton(onPressed: ()async{
                  SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

                  sharedPreferences.setString(Common.name,null);
                  print(sharedPreferences.getString(Common.name));
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) => Login()));

                },
                  child: ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),
              ]),
        ));
  }
}




class DropDownCars extends StatefulWidget {
  String c;
  @override
  State<StatefulWidget> createState() {
    return _DropState();

  }
}

class _DropState extends State<DropDownCars> {

  List<String> Cars =['MiniVan', 'PickUp', 'Jumpo',"Closed Body J"];

  String dropdownValue ;
  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<provid>(context);
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue ,
      iconEnabledColor: Colors.white,
      hint: Text("Please Select The Veichle",style: TextStyle(color: Colors.white),),


      style: TextStyle(fontSize: 18,
          color: Colors.black
      ),

      onChanged: (String newValue) {
        setState(() {
          bloc.ubdatecar(newValue);
          dropdownValue = newValue;
          return dropdownValue;

        });
      },
      items: Cars
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),

        );
      })
          .toList(),
    );


  }}
