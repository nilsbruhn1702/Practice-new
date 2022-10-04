import 'dart:math';

import 'package:flutter/material.dart';

import '../../services/pokemon_instance.dart';
import 'pokemon_value_generator.dart';

Widget PokemonCard(PokemonInstance pokemon) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/d4wcj31-53a8338d-c2b1-4a00-ad15-aaa314cb9f6b.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 10,
          color: Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 10,
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Image(
              image: AssetImage(
                  'images/pokemon/${pokemon.imageNumber.toString()}.jpg'),
            ),
          ),
        ),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Pokemon Name',
                  style: TextStyle(
                    fontFamily: 'Silkscreen',
                    fontSize: 30,
                  ),
                ),
                PokemonValuesColumn(pokemon)
              ]),
        )
      ],
    ),
  );
}
