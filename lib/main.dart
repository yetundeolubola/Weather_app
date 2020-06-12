import 'package:flutter/material.dart';
import 'package:weatherapp/screen/loading_screen.dart';
import 'package:weatherapp/utilities/contant.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kMainColor,
        scaffoldBackgroundColor: kMainColor,
      ),
      home: MyApp(),
    );
  }
}
