import 'dart:math';

class Dog {
  
  late int legs;
  late int eyes;
  late String name;
  int _weight = 30;
  
  Dog({required this.name, required this.eyes, required this.legs});

  int allBodyparts(){
    return eyes + legs;
  }

  void printDogsBodypartsAndEyes(){
    print('$name has $eyes eyes and ${this.allBodyparts()} bodyparts');
  }
}

void main(){
  var Jimmy = Dog(name: 'Jimmy', eyes: 2, legs: 4);
  print(Jimmy.allBodyparts());
  Jimmy.printDogsBodypartsAndEyes();
  print(Jimmy._weight);

}