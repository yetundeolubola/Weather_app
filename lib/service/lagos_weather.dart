import 'dart:async';
import 'package:weatherapp/service/network.dart';

const apiKey = '05d0c2d8e1448416585f5ad3798d0d57';
var url =
    'https://api.openweathermap.org/data/2.5/weather?q=lagos&appid=$apiKey';

class WeatherAp {
  Future<dynamic> getWeather() async {
    NetworkCall networkCall = NetworkCall(url);
    var weatherData = await networkCall.getData();
    return weatherData;
  }

  String getWeatherIcon(int condit) {
    if (condit < 300) {
      return '🌩';
    } else if (condit < 400) {
      return '🌧';
    } else if (condit < 600) {
      return '☔️';
    } else if (condit < 700) {
      return '☃️';
    } else if (condit < 800) {
      return '🌫';
    } else if (condit == 800) {
      return '☀️';
    } else if (condit <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
