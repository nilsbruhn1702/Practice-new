import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screen0.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text('Go Forwards To Screen 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              },
            ),
            TextButton(
                child: Text('Go Forwards To Screen 0'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen0(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
