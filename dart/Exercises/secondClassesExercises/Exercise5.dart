import 'Exercise2.dart';

class PointCol extends Point{
  late int color;
  late String name;
  static int numberOfPoints = 0;
  late int size;

  PointCol({required super.xPointValue, required super.yPointValue, required this.color}){
    numberOfPoints++;
  }

  PointCol.sizeOne({required super.xPointValue, required super.yPointValue, required this.name}): size = 1{
    numberOfPoints++;
  }
  
}
void main(){
  var coloredPoint = PointCol(xPointValue: 3, yPointValue: 4, color: 3);
  var anotherColoredPoint = PointCol.sizeOne(xPointValue: 4, yPointValue: 4, name: 'moin');

  print(anotherColoredPoint.name);
  print(PointCol.numberOfPoints);
  print(anotherColoredPoint.size);
}