import 'dart:html';
import 'dart:math';

class Dog {
  late int legs;
  late int eyes;
  late String name;
  int weight = 30;
  late VoidCallback onPressed;

  Dog(
      {required this.name,
      required this.eyes,
      required this.legs,
      required this.onPressed});

  int allBodyparts() {
    return eyes + legs;
  }

  void printDogsBodypartsAndEyes() {
    print('$name has $eyes eyes and ${this.allBodyparts()} bodyparts');
  }
}

void main() {
  var Jimmy =
      Dog(name: 'Jimmy', eyes: 2, legs: 4, onPressed: () => print('moin'));
  print(Jimmy.allBodyparts());
  Jimmy.printDogsBodypartsAndEyes();
  print(Jimmy.onPressed);
}
