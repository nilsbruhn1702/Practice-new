import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        //you need await modifier in order to get the thing 'behind' the future, but because it can takes time, the computer does the rest in the meantime insteaed
        desiredAccuracy: LocationAccuracy.high);

    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation();
            print('moin');
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
