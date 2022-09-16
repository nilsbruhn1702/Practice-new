import 'dart:math';

List getFirstAndLastElement(List randomList){
  List firstAndLastElement = [];
  firstAndLastElement.add(randomList.first);
  firstAndLastElement.add(randomList.last);
  return firstAndLastElement;
}
void main(){
  var randomNumber = Random();
  List randomList = List.generate(Random().nextInt(100), (_) => randomNumber.nextInt(122));
  print(randomList);
  print(getFirstAndLastElement(randomList));
}