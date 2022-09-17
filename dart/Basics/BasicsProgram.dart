import 'dart:math';

class Dog {

  int _weight = 30;
  
  var eyes;
  
  var legs;
  
  var name;
  
  String speed;
  
  Dog(String this.speed, {required this.name, required this.eyes, required this.legs});

  int allBodyparts(){
    return eyes + legs;
  }

  void printDogsBodypartsAndEyes(){
    print('$name has $eyes eyes and ${this.allBodyparts()} bodyparts');
  }
}

void main(){
  var Jimmy = Dog('schnell', name: 'Jimmy', eyes: 2, legs: 4);
  print(Jimmy.allBodyparts());
  Jimmy.printDogsBodypartsAndEyes();
  print(Jimmy._weight);

}