import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  Color cardColor;
  Widget conWidget;
  var onPress;
  ReUsableCard(
      {required this.cardColor,
      required this.conWidget,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          color: cardColor,
        ),
        child: conWidget,
      ),
    );
  }
}
