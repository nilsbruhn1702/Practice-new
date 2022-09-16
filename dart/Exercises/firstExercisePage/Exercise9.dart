import 'dart:async';
import 'dart:io';
import 'dart:math';
void main(){
  var number = Random().nextInt(100);
  print('take a guess, what number the computer chose between 0-100');
  dynamic playersChoice = stdin.readLineSync();
  playersChoice = int.parse(playersChoice!);
  if (number == playersChoice){
    print('Congrats, you guessed the right number');
  }
  else{
    switch (playersChoice>number){
      case (true): 
      print('your number is ${playersChoice-number} too high');
      break;
      case (false):
      print('your number is ${number-playersChoice} too low');
      break;
    }
  }
  print('computers number was $number');
}

