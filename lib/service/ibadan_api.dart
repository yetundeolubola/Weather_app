import 'dart:async';
import 'package:weatherapp/service/networkcall.dart';
import 'package:weatherapp/utilities/contant.dart';

const url =
    'https://api.openweathermap.org/data/2.5/weather?q=ibadan&appid=$apiKey&units=metric';

class IbadanApi {
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
