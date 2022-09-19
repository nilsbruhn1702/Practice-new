import 'dart:math';

class Dog {
  late int legs;
  late int eyes;
  late String name;
  int weight = 30;
  void sayHello = (int);

  Dog(
      {required this.name,
      required this.eyes,
      required this.legs,
      required this.sayHello});

  int allBodyparts() {
    return eyes + legs;
  }

  void printDogsBodypartsAndEyes() {
    print('$name has $eyes eyes and ${this.allBodyparts()} bodyparts');
  }
}

sumOfTwoNumbers(int a, int b) {
  return (a + b);
}

int Function(int a, int b) sumOfTwoNumbers2 = (a, b) => a + b;

void setState(String Function()) {
  print(Function());
}

void main() {
  var Jimmy = Dog(
      name: 'Jimmy', eyes: 2, legs: 4, sayHello: () => print('something else'));
  print(Jimmy.allBodyparts());
  Jimmy.printDogsBodypartsAndEyes();
  print(Jimmy.name);
  Dog(sayHello: () => print('hello'), eyes: 2, legs: 2, name: 'aselnuss');
  print(sumOfTwoNumbers(4, 3));
  print(sumOfTwoNumbers2(2, 2));
  setState(() => 'moin');
}
