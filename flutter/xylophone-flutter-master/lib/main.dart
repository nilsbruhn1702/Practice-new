import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final Player = AudioPlayer();
    Player.play(DeviceFileSource(
        '/Users/nils/Dev/Practice-new/flutter/xylophone-flutter-master/assets/note$soundNumber.wav'));
  }

  Expanded createTextButton({int soundNumber, MaterialColor buttonColor}) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor)),
          onPressed: () {
            playSound(soundNumber);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createTextButton(soundNumber: 1, buttonColor: Colors.blue),
              createTextButton(soundNumber: 2, buttonColor: Colors.blueGrey),
              createTextButton(soundNumber: 3, buttonColor: Colors.brown),
              createTextButton(soundNumber: 4, buttonColor: Colors.cyan),
              createTextButton(soundNumber: 5, buttonColor: Colors.purple),
              createTextButton(soundNumber: 6, buttonColor: Colors.green),
              createTextButton(soundNumber: 7, buttonColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
