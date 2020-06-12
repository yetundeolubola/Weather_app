import 'package:flutter/material.dart';

class ReuseWidget extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ReuseWidget({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colour,
        ),
      ),
    );
  }
}
