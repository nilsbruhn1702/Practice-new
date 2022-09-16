import 'dart:io';

List allDivisors(int number){
  List divisors = [];
  for (var i = 1; i <(number/2); i++){
    if (number%i == 0){
      divisors.add(i);
    }
  }
  return divisors;
}
void main(){
  print('Enter a number to show all divisors of that number');
  String? stringNumber = stdin.readLineSync();
  int number = int.parse(stringNumber!);
  print(allDivisors(number));
}