import 'dart:async';
import 'package:weatherapp/service/network.dart';
import 'package:weatherapp/screen/loading_screen.dart';

const apiKey = '05d0c2d8e1448416585f5ad3798d0d57';
var url =
    'https://api.openweathermap.org/data/2.5/weather?q=ibadan&appid=$apiKey';

class WeatherApi {
  Future<dynamic> getWeather() async {
    NetworkCall networkCall = NetworkCall(url);
    var weatherData = await networkCall.getData();
    return weatherData;
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
}
