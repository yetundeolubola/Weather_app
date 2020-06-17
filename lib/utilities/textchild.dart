import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/contant.dart';

class TextChild extends StatelessWidget {
  final String weatherIcon;
  final String weatherVar;
  final String weatherTxt;

  TextChild(
      {@required this.weatherIcon,
      @required this.weatherVar,
      @required this.weatherTxt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          weatherIcon,
          style: kIconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          weatherVar,
          style: kLabelTextStyle,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          weatherTxt,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
