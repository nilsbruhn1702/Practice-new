import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          //you need await modifier in order to get the thing 'behind' the future, but because it can takes time, the computer does the rest in the meantime insteaed
          desiredAccuracy: LocationAccuracy.low);
      //latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
