import 'dart:math';

void main(){
  var a = new Random();
  var x = new List.generate(Random().nextInt(10), (_) => a.nextInt(100));
  List listWithEvenNumbers = [];
  for (var i = 0; i < x.length; i++) {
    if (x[i].isEven) {
      listWithEvenNumbers.add(x[i]);
    }
  }
  print('the original list was: $x, out of that list these are the even numbers: $listWithEvenNumbers');
}