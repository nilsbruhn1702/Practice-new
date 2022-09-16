import 'dart:io';

Map <String, String> rules = {
  "Rock" : "Scissors",
  "Paper" : "Rock",
  "Scissors" : "Paper"
};


void main(){
  bool gameStatus = true;

  while (gameStatus == true){
    var paperRockSizzle = const ['Paper', 'Rock', 'Scissors'];
    paperRockSizzle.shuffle();
    String computerChoice = paperRockSizzle.first;
    print('''Enter your Choice: 'Paper', 'Rock' or 'Scissors' ''');
    String? playerChoice = stdin.readLineSync();
    if (playerChoice == computerChoice || ((playerChoice != ('Scissors')) && (playerChoice != ('Rock')) && (playerChoice != ('Paper')))){
      print('the computer chose the same thing or your input was invalid, try again');
      continue;
    }
    
      
    }
    
  }
}
