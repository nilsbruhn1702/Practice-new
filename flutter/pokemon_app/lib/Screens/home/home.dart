import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/data_handling/pokemon_data.dart';
import 'package:pokemon_app/screens/pokemon_card_view/pokemon_card_view.dart';
import 'package:pokemon_app/screens/settings_for_new_game.dart';
import 'package:pokemon_app/services/pokemon_instance.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'widgets/text_button_home.dart';

class Home extends StatelessWidget {
  static String id = 'Home';

  Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 100),
          child: Hero(
            tag: 'Pokemon Image',
            child: Container(
              width: 150,
              height: 150,
              child: Image(
                  image: AssetImage('images/Pokeball-PNG-Photo-Image.png'),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButtonHome(
              onPressed: () {
                Navigator.pushNamed(context, SettingsForNewGame.id);
              },
              text: 'Play new Game',
            ),
            TextButtonHome(
              onPressed: () {
                Provider.of<PokemonData>(context, listen: false)
                    .setPlayer(Player.playerTwo);
                Navigator.pushNamed(context, PokemonCardView.id);
              },
              text: 'Join a Game',
            )
          ],
        ),
      ),
    );
  }
}
