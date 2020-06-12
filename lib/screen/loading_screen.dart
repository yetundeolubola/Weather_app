import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/reuses.dart';
import 'package:weatherapp/utilities/cardchild.dart';
import 'package:weatherapp/service/ibadan_weather.dart';
import 'package:weatherapp/service/lagos_weather.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherApi weather = WeatherApi();
  WeatherAp weatherAp = WeatherAp();
  int temperature;
  int pressure;
  int humidity;
  String weatherIcon;
  void upDataUi(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      int pres = weatherData['main']['pressure'];
      pressure = pres;
      int hum = weatherData['main']['humidity'];
      humidity = hum;
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      var condit = weatherData['weather'][0]['id'];
      weatherIcon = weatherAp.getWeatherIcon(condit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(
            color: Color(0xFF343434),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Ibadan'),
                    onPressed: () async {
                      Text('Weather Condiion of Ibadan ');
                      var weatherData = await weather.getWeather();
                      upDataUi(weatherData);
                    },
                  ),
                  new RaisedButton(
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Lagos'),
                    onPressed: () async {
                      Text('Weather Condiion of Lagos ');
                      var weatherData = await weatherAp.getWeather();
                      upDataUi(weatherData);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFF202020),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReuseWidget(
                      colour: Color(0xFFFFFFFF),
                      cardChild: IconWidget(
                          nameIcons: '$weatherIcon',
                          nameVar: '$temperature°',
                          weatherVar: 'Temp'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReuseWidget(
                      colour: Color(0xFFFFFFFF),
                      cardChild: IconWidget(
                          nameIcons: '$weatherIcon',
                          nameVar: '$pressure',
                          weatherVar: 'Pressure'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReuseWidget(
                      colour: Color(0xFFFFFFFF),
                      cardChild: IconWidget(
                          nameIcons: '$weatherIcon',
                          nameVar: '$humidity',
                          weatherVar: 'Humidity'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
