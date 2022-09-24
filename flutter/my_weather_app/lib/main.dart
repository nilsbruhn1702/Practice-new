import 'package:flutter/material.dart';
import 'package:my_weather_app/Screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Weather App',
        theme: ThemeData.dark()
            .copyWith(primaryColor: Color.fromARGB(255, 95, 25, 108)),
        home: const LoadingScreen());
  }
}
