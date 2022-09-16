class Point{
  int xPointValue = 0;
  int yPointValue = 0; 
  static int nbOfPoints = 0;
  Point({required this.xPointValue, required this.yPointValue}){
    nbOfPoints++;
  }
}
void main(){
  var point1 = Point(xPointValue: 22, yPointValue: 31);
  print(point1.xPointValue);
  print(point1.yPointValue);
  var point2 = Point(xPointValue: 21, yPointValue: 55);
  print(Point.nbOfPoints);
}