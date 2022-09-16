import 'dart:io';

void main(){
  String letterFromStart;
  String letterFromEnd;
  print('''Enter the word that you want to check if it's a palindrome or not''');
  String? word = (stdin.readLineSync())!.toLowerCase();
  
  for (var i = 0; i < word.length; i++){
    if (word[i] == word[(word.length -1)- i]){
        if(i == word.length-i){
          print('Congrats, your word is a palindrome');
          break;
        }
      continue;
    }
    else{
      print(''' The word you've entered isn't a palindrome''');
      break;
    }
  }  
}