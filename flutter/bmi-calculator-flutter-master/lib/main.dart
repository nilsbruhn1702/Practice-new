import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 36, 3, 103),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 68, 19, 146),
        ),
      ),
      //scaffoldBackgroundColor: Color(0xFFA0E21),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/1': (context) => ResultsPage(),
      },
    );
  }
}
