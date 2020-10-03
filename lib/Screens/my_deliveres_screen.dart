import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:graduation/api/GetOrdrs.dart';
import 'package:graduation/api/getuser.dart';
import 'package:graduation/models/orderrecive.dart';

class MyDelivers extends StatefulWidget {
  @override
  _MyDeliversState createState() => _MyDeliversState();
}

class _MyDeliversState extends State<MyDelivers> {
  @override
  Widget build(BuildContext context) {


  GlobalKey<AsyncLoaderState> asyncloadero=
GlobalKey<AsyncLoaderState>();
var asyncLoader = AsyncLoader(

  key: asyncloadero,
  initState: () async => await GetOrder(),
  renderLoad: () => Center(child: new CircularProgressIndicator()),
  renderError: ([error]) => Page3(),
  renderSuccess: ({data})=> QuizBuilder(data),
);




  GlobalKey<AsyncLoaderState> asyncloader=
  GlobalKey<AsyncLoaderState>();
  var asyncLoaderwait = AsyncLoader(

    key: asyncloader,
    initState: () async => await GetOrder(),
    renderLoad: () => Center(child: new CircularProgressIndicator()),
    renderError: ([error]) => Page3(),
    renderSuccess: ({data})=> QuizBuilderwait(data),
  );

  GlobalKey<AsyncLoaderState> asyncloaderaproove=
  GlobalKey<AsyncLoaderState>();
  var asyncLoaderok = AsyncLoader(

    key: asyncloaderaproove,
    initState: () async => await GetOrder(),
    renderLoad: () => Center(child: new CircularProgressIndicator()),
    renderError: ([error]) => Page3(),
    renderSuccess: ({data})=> QuizBuilderok(data),
  );



  return DefaultTabController(length: 3,
      child: Scaffold(backgroundColor: Color(0xff2C3E50),
        appBar: AppBar(automaticallyImplyLeading: false,title: Text("3alafen",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),),centerTitle: true,
          backgroundColor: Color(0xff2C3E50),
          bottom: TabBar(tabs: <Widget>[
            Tab(child: Column(children: <Widget>[
              Text("waiting",style: TextStyle(fontSize: 16),),
              Text("Delivires",style: TextStyle(fontSize: 16)),
            ],),),
            Tab(child: Column(children: <Widget>[
              Text("accepted",style: TextStyle(fontSize: 16)),
              Text("Delivires",style: TextStyle(fontSize: 16)),
            ],
              
            ),),
            Tab(child: Column(children: <Widget>[
              Text("All",style: TextStyle(fontSize: 16)),
              Text("Delivires",style: TextStyle(fontSize: 16)),
            ],),),

          ]),
        ),body: TabBarView(children: <Widget>[
          asyncLoaderok,
          asyncLoaderwait,
          asyncLoader,
        ]),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Container(child: Image.asset("images/box.png"),),
      SizedBox(height: 15,),
      Text("There is No Delivires",style: TextStyle(color: Colors.white,fontSize: 20),)
    ],);
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(child: Image.asset("images/box.png"),),
        SizedBox(height: 15,),
        Text("dsc",style: TextStyle(color: Colors.white,fontSize: 20),)
      ],);
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(child: Image.asset("images/box.png"),),
        SizedBox(height: 15,),
        Text("There is No Delivires",style: TextStyle(color: Colors.white,fontSize: 20),)
      ],);
  }
}class nullorder extends StatelessWidget{

bool x,y;
OrderModel q;

nullorder({this.x,this.q,this.y});

  @override
  Widget build(BuildContext context) {
    if(this.x==false && this.y==true){
      return
        Container(padding: EdgeInsets.all(5),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,border: Border.all(color: Colors.black,width: 4),

            borderRadius: BorderRadius.circular(20.0),
          ),

          child: Column(children: <Widget>[
            Text("Reciver name : ${q.clientName}",style: TextStyle(fontSize: 18),),
            Text("phone : ${q.mobile}",style: TextStyle(fontSize: 18),),
            Text("location :  ${q.address.toString()  }",style: TextStyle(fontSize: 18),),]
          ),

        );
  }else return SizedBox(height: .001,);}}




class orderok extends StatelessWidget{

  bool x;
  OrderModel q;

  orderok({this.x,this.q});

  @override
  Widget build(BuildContext context) {
    if(this.x==false){
      return
        Container(padding: EdgeInsets.all(5),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,border: Border.all(color: Colors.black,width: 4),

            borderRadius: BorderRadius.circular(20.0),
          ),

          child: Column(children: <Widget>[
            Text("Reciver name : ${q.clientName}",style: TextStyle(fontSize: 18),),
            Text("phone : ${q.mobile}",style: TextStyle(fontSize: 18),),
            Text("location :  ${q.address.toString()  }",style: TextStyle(fontSize: 18),),]
          ),

        );
    }else return SizedBox(height: .001,);}}






class Order extends StatelessWidget{

  final OrderModel q;
  Order({this.q});



  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(5),
      height: 100,margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,border: Border.all(color: Colors.black,width: 4),

        borderRadius: BorderRadius.circular(20.0),
      ),

      child: Column(children: <Widget>[
        Text("Reciver name : ${q.clientName}",style: TextStyle(fontSize: 18),),
         Text("phone : ${q.mobile}",style: TextStyle(fontSize: 18),),
         Text("location :  ${q.address.toString()  }",style: TextStyle(fontSize: 18),),]),


    );
  }


}

Widget QuizBuilder(List<OrderModel> data) {

  return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Order(
              q: data[index],
            ));
      });
}








Widget QuizBuilderwait(List<OrderModel> data) {

  return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
           print(data[index].done);

             return  Padding(
               padding: const EdgeInsets.all(8.0),
               child: nullorder(
                 q: data[index],x:data[index].done ,y: data[index].ok,
               ));



      });
}
Widget QuizBuilderok(List<OrderModel> data) {

  return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        print(data[index].ok);

        return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: orderok(
              q: data[index],x:data[index].ok ,
            ));



      });
}