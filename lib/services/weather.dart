import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const String ApiKey='56e4a1e403dad4979e3a61e4e8ff3805';


class WeatherModel {

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    // api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$ApiKey
    //http://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=-122.08395287867832&appid=56e4a1e403dad4979e3a61e4e8ff3805
    var weatherData=await NetworkingHelper('http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKey&units=metric').getData();
    return weatherData;
  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(weatherData)));
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
