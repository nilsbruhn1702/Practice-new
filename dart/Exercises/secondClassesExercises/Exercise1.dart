class Point{
  int xPointValue = 0;
  int yPointValue = 0; 
  Point({required this.xPointValue, required this.yPointValue});
}
void main(){
  var point1 = Point(xPointValue: 22, yPointValue: 31);
  print(point1.xPointValue);
  print(point1.yPointValue);
}