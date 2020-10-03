import 'package:flutter/material.dart';


class Drop extends StatefulWidget {
String c;
  @override
  State<StatefulWidget> createState() {
    return _DropState();

  }
}

class _DropState extends State<Drop> {

  List<String> Government =["govern",'menofia', 'gharpya', 'cairo', 'dakahlya'];

  String dropdownValue = "govern";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
    isExpanded: true,
      value: dropdownValue ,
      underline: SizedBox(),

      style: TextStyle(fontSize: 15,
          color: Colors.grey
      ),


      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          return dropdownValue;

        });
      },
      items: Government
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );


  }
  }

