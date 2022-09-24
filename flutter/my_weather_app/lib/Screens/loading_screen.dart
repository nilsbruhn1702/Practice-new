import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_weather_app/Screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_weather_app/Services/coordinates.dart';
import 'package:my_weather_app/Services/nearby_locations.dart';
import 'package:my_weather_app/Services/weather_data.dart';
import 'package:my_weather_app/Services/weather_image.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> pushNextPage() async {
    Coordinates coordinates = Coordinates();
    WeatherData weatherData = WeatherData();
    WeatherImage weatherImage = WeatherImage();
    NearbyLocations nearbyLocations = NearbyLocations();
    await coordinates.getCoordinates();
    await weatherData.getTemperatureAndCondition(coordinates);
    await weatherImage.getImage(weatherData);
    await nearbyLocations.getNearbyLocation(coordinates);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherScreen(
            weatherData: weatherData,
            imageLink: weatherImage.imageSource,
            nearbyLocation: nearbyLocations);
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    pushNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitCircle(
      color: Colors.white,
      size: 50,
    ));
  }
}
