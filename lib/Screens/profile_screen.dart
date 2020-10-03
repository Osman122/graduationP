

import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';

import '../Common.dart';

class ProfileScreen extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    GlobalKey<AsyncLoaderState> asyncloaderadd=
    GlobalKey<AsyncLoaderState>();
    var asyncLoaderadress = AsyncLoader(
      key: asyncloaderadd,
      initState: () async => await Common.getadress(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Text(error),
      renderSuccess: ({data}) => Text(
        data,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.blue),
      ),
    );


    GlobalKey<AsyncLoaderState> asyncloaderphone=
    GlobalKey<AsyncLoaderState>();
    var asyncLoaderphone = AsyncLoader(
      key: asyncloaderphone,
      initState: () async => await Common.getphone(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Text(error),
      renderSuccess: ({data}) => Text(
        data,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.blue),
      ),
    );


    GlobalKey<AsyncLoaderState> asyncloadername=
    GlobalKey<AsyncLoaderState>();
    var asyncLoadername = AsyncLoader(
      key: asyncloadername,
      initState: () async => await Common.getusername(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Text(error),
      renderSuccess: ({data}) => Text(
        data,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.blue),
      ),
    );

    GlobalKey<AsyncLoaderState> asyncloadermail=
    GlobalKey<AsyncLoaderState>();
    var asyncLoadermail = AsyncLoader(
      key: asyncloadermail,
      initState: () async => await Common.getusermail(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Text(error),
      renderSuccess: ({data}) => Text(
        data,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.blue),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2C3E50),
        elevation: 0.00,
      ),
      backgroundColor: Color(0xff2C3E50),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          CircleAvatar(
            backgroundImage: AssetImage("images/user.png"),
            radius: 45,
          ),
          SizedBox(height: 15,),
           asyncLoadername,
          SizedBox(height: 10,),
          Divider(
            height: 10,
            indent: 70,
            endIndent: 70,
            color: Colors.white,
          ),
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
                title: asyncLoaderphone
              ),
            ),
          ),
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
                title: asyncLoadermail
              ),
            ),
          ),
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
                title:
                  asyncLoaderadress,

                
              ),
            ),
          )
        ],
      ),
    );

  }

}
