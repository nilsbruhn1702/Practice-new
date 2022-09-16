void main(){
  List original = [22, 32, 24, 33, 245, 32];
  List smaller_than_twenty = [];
  for (var i = 0; i < original.length; i++) {
    //print(original[i]);
    if (original[i] < 40) {
      smaller_than_twenty.add(original[i]);
    }
  }
  print(smaller_than_twenty);
}