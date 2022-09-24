import 'dart:convert';

import 'package:http/http.dart' as http;

const String apiKey = '3448b1bd446ecf27df12cfaa64232694';

class Weather {
  int temperature;
  int condition;

  Future<void> getCurrentWeather({double longitude, double latitude}) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      String data = response.body;
      temperature = (jsonDecode(data)['main']['temp'] - 273.5).round();
      condition = (jsonDecode(data)['weather'][0]['id']);
    } else {
      print(response.statusCode);
    }
  }
}
