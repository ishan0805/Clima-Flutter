import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 void Location()async
 {
   try {
     var weatherData = await WeatherModel().getLocationData();
     if(weatherData!=null)
     {
       var check =Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(weatherData)));
       if(check==null)
         {
           setState(() {

           });
         }
     }
   }
   catch(e)
   {
     setState(() {

     });
   }

 }
  @override
  void initState() {
    super.initState();
    Location();
 }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitCircle(color: Colors.red,size: 50,),
          ),
          Text("Getting your location , please turn on your GPS ",style: TextStyle(color: Colors.red,fontSize: 15.0),),
        ],
      )

    );
  }
}
