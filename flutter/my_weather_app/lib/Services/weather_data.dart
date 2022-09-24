import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather_app/Services/coordinates.dart';
import 'package:my_weather_app/Services/network_handler.dart';

const String apiKey = '3448b1bd446ecf27df12cfaa64232694';

class WeatherData {
  int? temperature;
  String? condition;

  Future<void> getTemperatureAndCondition(Coordinates coordinates) async {
    NetworkHandler networkHandler = NetworkHandler();
    await networkHandler.getResponse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$apiKey');
    var data = networkHandler.response.body;
    temperature = (jsonDecode(data)['main']['temp'] - 273.5).round();
    condition = (jsonDecode(data)['weather'][0]['main']);
    print('$temperature degrees');
    print(condition);
  }
}
