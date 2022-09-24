import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_weather_app/Services/coordinates.dart';
import 'package:my_weather_app/Services/network_handler.dart';
import 'package:my_weather_app/Services/weather_data.dart';

const String apiKey = '3448b1bd446ecf27df12cfaa64232694';

class NearbyLocations {
  String? locationName;
  String? locationCountry;

  Future<void> getNearbyLocation(Coordinates coordinates) async {
    NetworkHandler networkHandler = NetworkHandler();
    await networkHandler.getResponse(
        'http://api.openweathermap.org/geo/1.0/reverse?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$apiKey');
    var data = networkHandler.response.body;
    locationName = jsonDecode(data)[0]['name'];
    locationCountry = jsonDecode(data)[0]['country'];
    print(locationName);
    print(locationCountry);
  }
}
