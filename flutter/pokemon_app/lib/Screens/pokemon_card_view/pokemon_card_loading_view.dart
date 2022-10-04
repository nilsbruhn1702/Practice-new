import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemon_app/constants.dart';

import '../home/widgets/text_button_home.dart';

class PokemonCardLoadingView extends StatelessWidget {
  static String id = 'PokemonCardView';
  const PokemonCardLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'Pokemon Image',
        child: Image(
          image: AssetImage('images/Pokeball-PNG-Photo-Image.png'),
        ),
      ),
    );
  }
}
