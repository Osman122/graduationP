import 'dart:convert';
import 'package:graduation/models/orderrecive.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';


Future<List<OrderModel>> GetOrder() async {
  SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

  var response = await http.get(
    "https://alafyn20.herokuapp.com/orders/${sharedPreferences.getString(Common.email)}",
    headers: headers,

  );

  if (response.statusCode != 200 ||
      response.statusCode != 400 ||
      response.statusCode != 500) {

    print("ffffffffffff");
  }

  if (response.statusCode == 200) {
    List<OrderModel> newsList = ( json.decode(utf8.decode(response.bodyBytes)) as List)
        .map((data) => new OrderModel.fromJson(data))
        .toList();



return newsList;

    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    print(response.body);
List x=response.body as List;

    return x;
  } else if (response.statusCode == 415) {

    throw Exception('Failed to Submit Data444');
  } else {

    print(response.statusCode);

    throw Exception('Failed to Submit Dataaaaa5');






  }
}



Future<List<OrderModel>> GetOrderwait() async {
  SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

  var response = await http.get(
    "https://alafyn20.herokuapp.com/orders/${sharedPreferences.getString(Common.email)}",
    headers: headers,

  );

  if (response.statusCode != 200 ||
      response.statusCode != 400 ||
      response.statusCode != 500) {

    print("ffffffffffff");
  }

  if (response.statusCode == 200) {


    List<OrderModel> newsList = ( json.decode(utf8.decode(response.bodyBytes)) as List)
        .map((data) => new OrderModel.fromJson(data))
        .toList();



    return newsList;

    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    print(response.body);
    List x=response.body as List;

    return x;
  } else if (response.statusCode == 415) {

    throw Exception('Failed to Submit Data444');
  } else {

    print(response.statusCode);

    throw Exception('Failed to Submit Dataaaaa5');






  }
}


