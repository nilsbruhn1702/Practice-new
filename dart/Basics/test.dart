class Car {
  late final int ps;
  late final int highSpeed;
  late final String? brand;
  late final int productOfPsHighSpeed;

  Car(int ps, int highSpeed) {
    this.ps = ps;
    this.highSpeed = highSpeed;
    this.brand = brand;
    this.productOfPsHighSpeed = this.highSpeed * this.ps;
  }
}

class Bike {
  late final int ps;
  late final int highSpeed;
  late final int productOfPsHighSpeed;

  Bike({required this.ps, required this.highSpeed})
      : productOfPsHighSpeed = highSpeed * ps {}
}

void main() {
  var bike1 = Bike(highSpeed: 30, ps: 23);
  var car1 = Car(23, 33);
  var car2 = Car(23, 22);
  car2..brand = 'BMW';
  print(car2.brand);
  print(bike1.productOfPsHighSpeed);
  print(car1.productOfPsHighSpeed);
}
