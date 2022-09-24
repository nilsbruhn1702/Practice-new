import 'package:flutter/material.dart';
import 'package:my_weather_app/Services/nearby_locations.dart';
import 'package:my_weather_app/Utilities/extensions.dart';
import 'package:my_weather_app/constants.dart';
import '../Services/weather_data.dart';
import '../widgets/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  WeatherData weatherData;
  String imageLink;
  NearbyLocations nearbyLocation;
  WeatherScreen(
      {super.key,
      required this.weatherData,
      required this.imageLink,
      required this.nearbyLocation});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontFamily: 'WorkSans');
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageLink!),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 25,
            child: WeatherCard(
              child: Stack(children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(nearbyLocation.locationCountry ?? '',
                      style: kTextStyleWeatherAppNormal),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text(nearbyLocation.locationName ?? '',
                      style: kTextStyleWeatherAppBold),
                ),
              ]),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 25,
            child: WeatherCard(
              child: Stack(children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    weatherData.condition!.capitalize(),
                    style: kTextStyleWeatherAppBold,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text(
                    '${weatherData.temperature.toString()} °',
                    style: kTextStyleWeatherAppNormal,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
