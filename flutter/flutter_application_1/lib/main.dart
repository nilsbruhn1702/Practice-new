import 'package:flutter/material.dart';

double sizedBoxHeight = 5;
double paddingValue = 10;
double marginValue = 20;
double sizedBoxWidth = 10;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg'),
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Text('Manfred Müller'),
              Text(
                'Project Manager'.toUpperCase(),
                style: TextStyle(fontSize: 10.0, fontFamily: 'Oswald'),
              ),
              SizedBox(height: sizedBoxHeight),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('09834 343424'))),
              ),
              SizedBox(height: sizedBoxHeight),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: sizedBoxWidth),
                        Text('maxmustermann@gmail.com')
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
