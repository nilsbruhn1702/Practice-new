import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/widgets/weight_and_age_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../classes/bmiData.dart';
import '../widgets/gender_card.dart';
import '../widgets/reusable_container_input_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleActiveColor = Colors.purple;
  Color femaleActiveColor = Colors.purple;
  bool gender = false; //female
  int height = 180;
  String weight = '63';
  String age = '35';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainerInputPage(
                    cardColor: maleActiveColor,
                    onTap: () {
                      checkForColor(Gender.male);
                      setState(() {});
                    },
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainerInputPage(
                    cardColor: femaleActiveColor,
                    onTap: () {
                      checkForColor(Gender.female);
                      setState(() {});
                    },
                    cardChild: GenderCardContent(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainerInputPage(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kBmiTextStyle.copyWith(fontSize: 100),
                      ),
                      Text(
                        'cm',
                        style: kBmiTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: Color.fromARGB(255, 96, 24, 108),
                    inactiveColor: Color.fromARGB(255, 188, 50, 212),
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableContainerInputPage(
                  cardChild: WeightAndAgeCard(
                    text: '$weight kg',
                    firstIcon: FontAwesomeIcons.plus,
                    secondIcon: FontAwesomeIcons.minus,
                    onTapFirst: () {
                      setState(() {
                        int bufferWeight = int.parse(weight) + 1;
                        weight = bufferWeight.toString();
                        print(weight);
                      });
                    },
                    onTapSecond: () {
                      setState(() {
                        int bufferWeight = int.parse(weight) - 1;
                        weight = bufferWeight.toString();
                        print(weight);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ReusableContainerInputPage(
                  cardChild: WeightAndAgeCard(
                    text: ('$age years'),
                    firstIcon: FontAwesomeIcons.plus,
                    secondIcon: FontAwesomeIcons.minus,
                    onTapFirst: () {
                      setState(() {
                        int bufferAge = int.parse(age) + 1;
                        age = bufferAge.toString();
                        print(age);
                      });
                    },
                    onTapSecond: () {
                      setState(() {
                        int bufferAge = int.parse(age) - 1;
                        age = bufferAge.toString();
                        print(age);
                      });
                    },
                  ),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              bmiData bufferData = bmiData(height.toInt(), age, weight, gender);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResultsPage(bufferData: bufferData)));
            },
            child: Container(
              height: 90,
              width: double.infinity,
              color: Color.fromARGB(255, 244, 54, 165),
              child: Center(
                  child: Text('CALCULATE',
                      style: kBmiTextStyle.copyWith(fontSize: 40))),
            ),
          )
        ],
      ),
    );
  }

  void checkForColor(Gender selectedGender) {
    switch (selectedGender) {
      case Gender.male:
        maleActiveColor = Color.fromARGB(255, 199, 49, 225);
        femaleActiveColor = Colors.purple;
        gender = true;
        break;
      case Gender.female:
        maleActiveColor = Colors.purple;
        femaleActiveColor = Color.fromARGB(255, 199, 49, 225);
    }
  }
}
