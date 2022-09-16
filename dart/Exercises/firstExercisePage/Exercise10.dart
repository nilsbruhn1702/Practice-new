import 'dart:math';

void checkIfPrime(int randomNumber) {
  //print('debug');
  for (var i = 2; i < randomNumber; i++){
    //print('debug');
    if (randomNumber%i == 0){
      return print('$randomNumber is not prime');
    }
  }
  return print('$randomNumber is prime');
}
void main(){
  int randomNumber = Random().nextInt(100);
  checkIfPrime(1);
}

