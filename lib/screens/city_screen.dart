import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                   style: TextStyle(color: Colors.black,fontSize: 15.0),
                   onChanged: (value){
                     cityName=value;
                   },
                   decoration: InputDecoration(
                     fillColor: Colors.white,
                     hintText: "Enter City Name",
                     hintStyle: TextStyle(color: Colors.grey),
                     filled: true,
                     border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15.0))) ,
                     icon:Icon(Icons.location_city,size:40.0),
                   ),
                  ),
                ),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: FlatButton(
                   color:Colors.greenAccent,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                    Navigator.pop(context,cityName);
                  },

                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,

              ),
              ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
