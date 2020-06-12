import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/contant.dart';

class IconWidget extends StatelessWidget {
  final String nameIcons;
  final String nameVar;
  final String weatherVar;

  IconWidget(
      {@required this.nameIcons,
      @required this.nameVar,
      @required this.weatherVar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          nameIcons,
          style: kIconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          nameVar,
          style: kLabelTextStyle,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          weatherVar,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
