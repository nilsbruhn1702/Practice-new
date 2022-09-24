import 'dart:convert';
import 'package:my_weather_app/Services/network_handler.dart';
import 'package:my_weather_app/Services/weather_data.dart';

const String apiKeyImage = '30144459-17c5210a55c59019a754116a4';

class WeatherImage {
  late String imageSource;
  late String temperatureDescription = '';

  Future<void> getImage(WeatherData weatherData) async {
    if (weatherData.temperature! < 10) {
      temperatureDescription = 'cold';
    } else if (weatherData.temperature! > 25) {
      temperatureDescription = 'hot';
    }

    if (weatherData.condition == 'clear') {
      weatherData.condition = 'sunny';
    } else {}

    NetworkHandler networkHandler = NetworkHandler();
    await networkHandler.getResponse(
        'https://pixabay.com/api/?key=$apiKeyImage&q=$temperatureDescription+${weatherData.condition}+weather&image_type=photo&category=nature');
    var data = networkHandler.response.body;
    try {
      var link = (jsonDecode(data)['hits'][0]['largeImageURL']);
      imageSource = link;
    } catch (e) {
      imageSource =
          'https://www.allfreegraphics.com/wp/wp-content/uploads/2020/06/abstract_blue_background-768x1024.jpg';
    }
  }
}
