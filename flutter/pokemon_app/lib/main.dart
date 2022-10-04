import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/constants.dart';
import 'package:pokemon_app/data_handling/pokemon_data.dart';
import 'package:pokemon_app/screens/turn_controller.dart';
import 'package:pokemon_app/screens/pokemon_card_view/pokemon_card_view.dart';
import 'package:provider/provider.dart';

import 'screens/home/home.dart';
import 'screens/pokemon_card_view/pokemon_card_loading_view.dart';
import 'screens/settings_for_new_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonData(),
      child: MaterialApp(
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
          PokemonCardLoadingView.id: (context) => PokemonCardLoadingView(),
          PokemonCardView.id: (context) => PokemonCardView(),
          SettingsForNewGame.id: (context) => SettingsForNewGame(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
