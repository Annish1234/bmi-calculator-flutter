import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild,this.whenPress});

  final Color colour;
  final Widget cardChild;
  final Function whenPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}