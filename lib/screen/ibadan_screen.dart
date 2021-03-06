import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/reuse_widget.dart';
import 'package:weatherapp/utilities/textchild.dart';
import 'package:weatherapp/service/ibadan_api.dart';

class IbadanScreen extends StatefulWidget {
  @override
  _IbadanScreenState createState() => _IbadanScreenState();
}

class _IbadanScreenState extends State<IbadanScreen> {
  IbadanApi weather = IbadanApi();
  int temperature = 0;
  int pressure = 0;
  int humidity = 0;
  String weatherIcon = '🌩';

  void updateValue(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      int pres = weatherData['main']['pressure'];
      pressure = pres;
      int hum = weatherData['main']['humidity'];
      humidity = hum;
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      var condit = weatherData['weather'][0]['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getWeather();
                      updateValue(weatherData);
                    },
                    child: Icon(
                      Icons.touch_app,
                      size: 50.0,
                      color: Color(0xFFE6322D),
                    ),
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
                      textChild: TextChild(
                          weatherIcon: '$weatherIcon',
                          weatherVar: '$temperature°',
                          weatherTxt: 'Temp'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReuseWidget(
                      colour: Color(0xFFFFFFFF),
                      textChild: TextChild(
                          weatherIcon: '$weatherIcon',
                          weatherVar: '$pressure',
                          weatherTxt: 'Pressure'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReuseWidget(
                      colour: Color(0xFFFFFFFF),
                      textChild: TextChild(
                          weatherIcon: '$weatherIcon',
                          weatherVar: '$humidity',
                          weatherTxt: 'Humidity'),
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
