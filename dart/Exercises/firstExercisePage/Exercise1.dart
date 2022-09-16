import 'dart:io';

void main(){
  print('Enter your name');
  String? name = stdin.readLineSync();
  print('Enter your age');
  String? string_age = stdin.readLineSync();
  int age = int.parse(string_age!);
  int years_to_live = 100-age;
  print('you have $years_to_live years left to live');
}