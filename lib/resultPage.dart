import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatelessWidget {
  String bmiResult;
  String resultText;
  String resultInterpretation;

  ResultPage(this.bmiResult, this.resultText, this.resultInterpretation);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyBackground,
      appBar: AppBar(
        backgroundColor: kBodyBackground,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Your Result',
                  style: kNumberTextStyle,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              height: 300.0,
              color: kActiveCardColor,
              padding: EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('$resultText', style: kMysize),
                    Text('$bmiResult',
                        style: TextStyle(
                            fontSize: 46.0, fontWeight: FontWeight.bold)),
                    Text(
                      '$resultInterpretation',
                      style: kMysize,
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kButtonColor,
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Re-Calculate', style: kMysize),
                    SizedBox(width: 10.0),
                    Icon(FontAwesomeIcons.refresh),
                  ],
                )),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
