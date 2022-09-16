import 'dart:io';

void main(){
  print('enter a number');
  String? string_number = stdin.readLineSync();
  int number = int.parse(string_number!);
  if (number%2 == 0){
    print('your number is even');
    }
  else{
    print('your number is odd');
  }
}