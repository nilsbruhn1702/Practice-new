import 'dart:math';

class PokemonInstance {
  late int power;
  late int size;
  late int health;
  late int endurance;
  late int imageNumber;
  int getRandomNumber() {
    int number;
    Random random = Random();
    number = random.nextInt(100) + 1;
    return number;
  }

  PokemonInstance() {
    imageNumber = getRandomNumber();
    power = getRandomNumber();
    size = getRandomNumber();
    endurance = getRandomNumber();
    health = getRandomNumber();
  }
  PokemonInstance.get(List pokemonValues) {
    imageNumber = pokemonValues[0];
    power = pokemonValues[1];
    size = pokemonValues[2];
    endurance = pokemonValues[3];
    health = pokemonValues[4];
  }
}
