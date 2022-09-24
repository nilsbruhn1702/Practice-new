import 'dart:io';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    getWeatherData(location);
  }

  Future<void> getWeatherData(Location location) async {
    Weather weather = Weather();
    await weather.getCurrentWeather(
        longitude: location.longitude, latitude: location.latitude);
    WeatherModel weatherModel;

    String icon = weatherModel.getWeatherIcon(weather.condition);

    String text = weatherModel.getMessage(weather.temperature);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weather: weather, icon: icon, text: text);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
