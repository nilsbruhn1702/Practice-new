import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Widget child;
  WeatherCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      child: child,
      height: 250,
      width: 250,
      elevation: 10,
      color: Color.fromARGB(45, 0, 0, 0),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    );
  }
}
