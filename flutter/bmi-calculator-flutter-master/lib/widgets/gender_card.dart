import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderCardContent extends StatelessWidget {
  IconData icon;
  String text;
  GenderCardContent({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Icon(
          icon,
          size: 120,
          color: Colors.white,
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: kBmiTextStyle),
        )
      ],
    );
  }
}
