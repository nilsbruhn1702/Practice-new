import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_container_input_page.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  double bmi;
  var bufferData;
  ResultsPage({this.bufferData});

  String calculateBMI(var bufferData) {
    int weight = int.parse(bufferData.weight);
    bmi = (weight / pow(bufferData.height / 100, 2));
    return bmi.toStringAsFixed(1);
  }

  String getResultText(double bmi) {
    if (bmi < 18.5) {
      return 'too skinny!';
    }
    if (bmi > 18.5 && bmi < 25) {
      return 'normal, good!';
    } else {
      return 'too fat!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 54, 244),
        title: Text('RESULTS', style: kBmiTextStyle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableContainerInputPage(
              cardChild: Center(
                child: Text(
                  calculateBMI(bufferData),
                  style: kBmiTextStyle.copyWith(fontSize: 120),
                ),
              ),
            ),
          ),
          Expanded(
              child: ReusableContainerInputPage(
            cardChild: Center(
                child: Text(
              getResultText(bmi),
              style: kBmiTextStyle.copyWith(fontSize: 40),
            )),
          ))
        ],
      ),
    );
  }
}
