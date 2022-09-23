import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class WeightAndAgeCard extends StatelessWidget {
  final String text;
  final IconData firstIcon;
  final IconData secondIcon;
  final Function onTapFirst;
  final Function onTapSecond;

  WeightAndAgeCard({
    @required this.text,
    @required this.firstIcon,
    @required this.secondIcon,
    @required this.onTapFirst,
    @required this.onTapSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text, style: kBmiTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  elevation: 0,
                  child: Icon(firstIcon),
                  backgroundColor: Color.fromARGB(255, 188, 50, 212),
                  onPressed: onTapFirst),
              FloatingActionButton(
                  elevation: 0,
                  child: Icon(secondIcon),
                  backgroundColor: Color.fromARGB(255, 188, 50, 212),
                  onPressed: onTapSecond),
            ],
          )
        ],
      ),
    );
  }
}
