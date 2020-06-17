import 'package:flutter/material.dart';
import 'package:weatherapp/screen/lagos_screen.dart';
import 'package:weatherapp/screen/ibadan_screen.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF1F1F1),
            bottom: TabBar(
              labelColor: Color(0xFF030303),
              indicatorColor: Color(0xFF030303),
              tabs: [
                Tab(
                  text: 'Ibadan',
                ),
                Tab(
                  text: 'Lagos',
                ),
              ],
            ),
            title: Text(
              'Weather App',
              style: TextStyle(
                color: Color(0xFF030303),
              ),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              IbadanScreen(),
              LagosScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
