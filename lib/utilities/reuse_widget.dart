import 'package:flutter/material.dart';

class ReuseWidget extends StatelessWidget {
  final Color colour;
  final Widget textChild;

  ReuseWidget({@required this.colour, this.textChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: textChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colour,
        ),
      ),
    );
  }
}
