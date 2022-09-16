class Cuboid{
  late int xValue;
  late int yValue;
  late int zValue;

  Cuboid({required xValue, required yValue, required zValue});

  Cuboid.cube({required int cubeValue}){
    this.xValue = cubeValue;
    this.yValue = cubeValue;
    this.zValue = cubeValue;
  }
}

void main(){
  var object1 = Cuboid.cube(cubeValue: 4);
  print(object1.xValue);
}