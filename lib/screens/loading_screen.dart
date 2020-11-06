import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
const String ApiKey='56e4a1e403dad4979e3a61e4e8ff3805';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  @override
  void initState() {
    super.initState();
   getLocationData();
  }
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude=location.longitude;
    latitude=location.latitude;
    var weatherData=NetworkingHelper('api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$ApiKey');

    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
       child: SpinKitCirclen(color: Colors.red,size: 50,),
      ),
    );
  }
}
