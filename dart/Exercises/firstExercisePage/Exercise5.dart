import 'dart:math';

bool compareListsLength(List x, List y){
  if (x.length < y.length){
    
    return false ;
  }
  return true;
}

List compareListsContent(bool listxIsLonger, List x, List y){
  List equalValue = [];
  if (listxIsLonger == true){
    for (var i = 0; i < x.length; i++){
      for (var j = 0; j < y.length; j++){
        if (x[i] == y[j]){
          equalValue.add(x[i]);
          
        }
      }      
    }
    return equalValue;
  }
  for (var i = 0; i < y.length; i++){
    for (var j = 0; j < x.length; j++){
      if (y[i] == x[j]){
        equalValue.add(y[i]);
      }
    }
  }
  return equalValue;
}
void main(){
  bool listxIsLonger;
  var a = new Random();
  var x = new List.generate(Random().nextInt(10), (_) => a.nextInt(100));
  print(x);

  var b = new Random();
  var y = new List.generate(Random().nextInt(10), (_) => b.nextInt(100));
  print(y);

  listxIsLonger = compareListsLength(x, y);
  print(compareListsContent(listxIsLonger, x, y));
}



