import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/pokemon_card_view/pokemon_card_view.dart';
import 'package:provider/provider.dart';

import '../Screens/home/home.dart';
import '../constants.dart';
import '../data_handling/pokemon_data.dart';
import '../services/pokemon_instance.dart';
import 'home/widgets/text_button_home.dart';

class SettingsForNewGame extends StatelessWidget {
  SettingsForNewGame({super.key});

  static String id = 'Settings for new Game';

  final _firestore = FirebaseFirestore.instance;

  String getTextUnderCounter(BuildContext context) {
    if (Provider.of<PokemonData>(context, listen: true).numberOfCards == 20) {
      return 'You have reached the maximum amount of cards';
    }
    if (Provider.of<PokemonData>(context, listen: true).numberOfCards == 5) {
      return 'You have reached the minimum amount of cards';
    } else {
      return '';
    }
  }

  void createPokemon(int numberOfCards, Player player) {
    for (var i = 0; i < numberOfCards; i++) {
      PokemonInstance pokemonInstance = PokemonInstance();
      List pokemonInstancArray = [
        pokemonInstance.imageNumber,
        pokemonInstance.power,
        pokemonInstance.size,
        pokemonInstance.health,
        pokemonInstance.endurance
      ];
      _firestore
          .collection('pokemon_player_${player.index + 1}')
          .add({'pokemonInstance': pokemonInstancArray});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(child: Text(''), preferredSize: Size(0, 20)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image(
              image: AssetImage('images/Pokeball-PNG-Photo-Image.png'),
              fit: BoxFit.contain),
        ),
        title: PokemonText(text: 'Pokemon Quartett'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 20,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 200,
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'How many cards do you want to play with?',
                      speed: Duration(milliseconds: 50),
                      textStyle: TextStyle(
                        fontFamily: 'Silkscreen',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => {
                          Provider.of<PokemonData>(context, listen: false)
                                      .numberOfCards ==
                                  5
                              ? print('counter at 5')
                              : Provider.of<PokemonData>(context, listen: false)
                                  .changeNumberOfCards(-1)
                        },
                        child: Icon(
                          Icons.remove,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${Provider.of<PokemonData>(context, listen: true).numberOfCards}',
                        style: TextStyle(
                          fontFamily: 'Silkscreen',
                          fontSize: 50,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<PokemonData>(context, listen: false)
                                      .numberOfCards ==
                                  20
                              ? print('counter at 20')
                              : Provider.of<PokemonData>(context, listen: false)
                                  .changeNumberOfCards(1);
                        },
                        child: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 60,
                    width: 160,
                    child: Text(getTextUnderCounter(context),
                        style: TextStyle(
                          fontFamily: 'Silkscreen',
                          fontSize: 12,
                          color: Color.fromARGB(129, 255, 255, 255),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  int numberOfCards =
                      Provider.of<PokemonData>(context, listen: false)
                          .numberOfCards;
                  createPokemon(numberOfCards, Player.playerOne);
                  createPokemon(numberOfCards, Player.playerTwo);
                  Provider.of<PokemonData>(context, listen: false)
                      .setPlayer(Player.playerOne);
                  Navigator.pushNamed(context, PokemonCardView.id);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: PokemonText(text: 'Play'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
