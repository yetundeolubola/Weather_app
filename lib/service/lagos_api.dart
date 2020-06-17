import 'dart:async';
import 'package:weatherapp/service/networkcall.dart';
import 'package:weatherapp/utilities/contant.dart';

class LagosApi {
  Future<dynamic> getWeather() async {
    NetworkCall networkCall = NetworkCall(urlLagos);
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
