import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemon_app/screens/pokemon_card_view/pokemon_card_loading_view.dart';
import 'package:pokemon_app/services/pokemon_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data_handling/pokemon_data.dart';
import '../../screens/pokemon_card_view/pokemon_card.dart';
import '../../screens/pokemon_card_view/pokemon_value_generator.dart';
import '../home/widgets/text_button_home.dart';

class PokemonCardView extends StatefulWidget {
  static String id = 'Pokemon Card View';
  PokemonCardView({super.key});

  @override
  State<PokemonCardView> createState() => _PokemonCardViewState();
}

class _PokemonCardViewState extends State<PokemonCardView> {
  int cardsLeft = 0;
  final _firestore = FirebaseFirestore.instance;

  Future<void> setCurrentCard(Map<String, dynamic> data) async {
    await _firestore
        .collection('current_cards')
        .doc('DL6qBn0ijIWFEKG5SDPy')
        .collection(
            Provider.of<PokemonData>(context, listen: false).player.toString())
        .doc('r4Ku5BJqSKiLdSgvi3NI')
        .set(data);
  }

  Future<List> getPokemonInstance() async {
    final pokemonList = await _firestore
        .collection(
            'pokemon_player_${Provider.of<PokemonData>(context, listen: true).player.index + 1}')
        .get();
    print(pokemonList.docs[0].data());
    setCurrentCard(pokemonList.docs[0].data());

    return pokemonList.docs[0].data()['pokemonInstance'];
  }

  @override
  Widget build(BuildContext context) {
    if ((Provider.of<PokemonData>(context, listen: true).turn == true &&
            Provider.of<PokemonData>(context, listen: true).player ==
                Player.playerOne) ||
        Provider.of<PokemonData>(context, listen: true).turn == false &&
            Provider.of<PokemonData>(context, listen: true).player ==
                Player.playerTwo) {
      print(Provider.of<PokemonData>(context, listen: true).turn);
      print(Provider.of<PokemonData>(context, listen: true).player);
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
        body: FutureBuilder(
            future: getPokemonInstance(),
            builder: (context, snapshot) {
              if ((snapshot.connectionState == ConnectionState.done) &&
                  (snapshot.data != null)) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 195, 98, 0),
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Cards left : ${cardsLeft.toString()}',
                            style: TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 10,
                      height: MediaQuery.of(context).size.height - 230,
                      child: Stack(
                        children: [
                          PokemonCard(PokemonInstance.get(snapshot.data!)),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return PokemonCardLoadingView();
              }
            }),
      );
    } else {
      print(Provider.of<PokemonData>(context, listen: true).turn);
      print(Provider.of<PokemonData>(context, listen: true).player);
      return Container();
    }
  }
}
