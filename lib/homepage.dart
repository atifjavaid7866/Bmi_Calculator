import 'package:bmicalculator/calbmi.dart';
import 'package:bmicalculator/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'constant.dart';
import 'selectweighthight.dart';

enum CardColorType { male, female }

enum SelectedUnit { cm, m } //Height Unit

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CardColorType? selectedGender;
  double weight = 0;
  double height = 0;
  int selectedheight = 80;
  SelectedUnit selUni = SelectedUnit.cm;

  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBodyBackground,
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReUsableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = CardColorType.male;
                        });
                      },
                      cardColor: selectedGender == CardColorType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      conWidget: IconDatta(
                        iconn: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: ReUsableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = CardColorType.female;
                        });
                      },
                      cardColor: selectedGender == CardColorType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      conWidget: IconDatta(
                        iconn: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  // margin: EdgeInsets.symmetric(v: 5.0),
                  decoration: BoxDecoration(
                    color: kConBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Height', style: kMysize),
                          Container(
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selUni = SelectedUnit.cm;
                                  });
                                },
                                child: CircleAvatar(
                                  child: Text('CM'),
                                  backgroundColor: selUni == SelectedUnit.cm
                                      ? kInactiveCardColor
                                      : kActiveCardColor,
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selUni = SelectedUnit.m;
                                  });
                                },
                                child: CircleAvatar(
                                  child: Text('M'),
                                  backgroundColor: selUni == SelectedUnit.m
                                      ? kInactiveCardColor
                                      : kActiveCardColor,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('$selectedheight', style: kNumberTextStyle),
                          Text(
                            selUni == SelectedUnit.cm ? 'cm' : 'm',
                            style: kMysize,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          thumbColor: Color(0xffeb1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29eb1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0),
                        ),
                        child: Slider(
                            min: 60,
                            max: 100,
                            inactiveColor: Color(0xff8d8e98),
                            value: selectedheight.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                selectedheight = newValue.round();
                              });
                            }),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 7.0),
            Expanded(
              child: Row(
                children: [
                  Expanded(
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
                          Text('$weight', style: kMysize),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight > 0 ? weight -= 1 : 0;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kConBackground,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Age', style: kMysize),
                          Text('$height', style: kMysize),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    height += 1;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    height > 0 ? height -= 1 : 0;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            GestureDetector(
              onTap: () {
                CalBmi newcal = CalBmi(
                  height: selectedheight.toDouble(),
                  weight: weight,
                ); //selUni.toString());

                String result = newcal.cal_Bmi();
                String text = newcal.resultText();
                String inter = newcal.resultInterpretation();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(result, text, inter);
                }));
              },
              child: Container(
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kButtonColor,
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Calculate', style: kMysize),
                    SizedBox(width: 10.0),
                    Icon(FontAwesomeIcons.refresh),
                  ],
                )),
              ),
            ),
            SizedBox(height: 10.0),
          ],
          //Icon(FontAwesomeIcons.refresh),
        ),
      ),
    );
  }
}

class IconDatta extends StatelessWidget {
  final IconData iconn;
  final String label;
  IconDatta({required this.iconn, required this.label});
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconn,
          size: 80.0,
        ),
        SizedBox(height: 12.0),
        Text(label, style: TextStyle(fontSize: 18.0)),
      ],
    );
  }
}
