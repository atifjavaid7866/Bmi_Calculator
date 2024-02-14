import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';

class SelecWeightHight extends StatelessWidget {
  int weght;

  final onressed;
  SelecWeightHight({required this.weght, required this.onressed});
  // SelecWeightHight({required this.weight, required this.hight});
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kConBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Weight', style: kMysize),
            Text('$weght', style: kMysize),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onressed,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(width: 25.0),
                GestureDetector(
                  onTap: onressed,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Icon(FontAwesomeIcons.minus),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
