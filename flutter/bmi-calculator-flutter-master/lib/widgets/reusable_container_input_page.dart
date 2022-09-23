import 'package:flutter/material.dart';

import '../pages/input_page.dart';

class ReusableContainerInputPage extends StatelessWidget {
  final Widget cardChild;
  Color cardColor;
  Function onTap;

  ReusableContainerInputPage({
    this.cardChild,
    this.onTap,
    this.cardColor = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
        child: cardChild,
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
