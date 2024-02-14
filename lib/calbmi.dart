import 'package:flutter/material.dart';
import 'dart:math';

class CalBmi {
  double height;
  double weight;
  double _result = 0.0;
  // which unit should be used either cm or m

  CalBmi({required this.height, required this.weight});

  String cal_Bmi() {
    _result = weight / pow(height / 100, 2);
    return _result.toStringAsFixed(1);
  }

  String resultText() {
    if (_result > 25) {
      return 'OverWeight';
    } else if (_result > 18.5) {
      return 'Normal';
    } else {
      return 'Low';
    }
  }

  String resultInterpretation() {
    if (_result > 25) {
      return 'Please  focus on diet and do exercise daily';
    } else if (_result > 18.5) {
      return 'Great! Keep Exercise Daily';
    } else {
      return 'Eate healthy Food to gain some weight';
    }
  }
}
