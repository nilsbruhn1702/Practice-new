import 'package:bitcoin_ticker/classes/network_handler.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BitCoinRating {
  String rating;
  String selectedCurrency;
  BitCoinRating(this.selectedCurrency);

  Future<void> getRating() async {
    NetworkHandler networkHandler = NetworkHandler();
    await networkHandler.getResponse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=10DC0902-3AD7-472C-A118-D9D774026642');
    dynamic data = networkHandler.response.body;
    this.rating = (jsonDecode(data)['rate']).round().toString();
  }
}
