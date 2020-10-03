import 'package:flutter/material.dart';
import 'package:graduation/components/dropdown.dart';
class DropCity extends StatefulWidget {

  @override


  List<String> gharpya =["City","tanta", 'santa', 'kafr elzayat'];
  List<String> menofya =["City","shibin", 'santa', 'kafr elzayat'];

  List<String> ll ;
  State<StatefulWidget> createState() {
    return _DropCityState(ll);



  }
}

class _DropCityState extends State<DropCity> {
 _DropCityState(this.ss );
 List<String> ss  ;

  String dropdownValue = "City";
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
        });
      },
      items: ss
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

