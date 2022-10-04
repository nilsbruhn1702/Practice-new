import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../../data_handling/pokemon_data.dart';
import '../../services/pokemon_instance.dart';

class PokemonValuesColumn extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final PokemonInstance pokemon;

  void turnStream() async {
    await for (var snapshot in _firestore.collection('turn').snapshots()) {
      print(snapshot.docs[0].get('GameCreator'));
    }
  }
  // todo: Delete turnStream method from Widget

  PokemonValuesColumn(this.pokemon);

  @override
  Widget build(BuildContext context) {
    /* if (Provider.of<PokemonData>(context, listen: false).player.toString() == 'Play')
    void compareValues() async {
      var data = await _firestore
        .collection('current_cards')
        .doc('DL6qBn0ijIWFEKG5SDPy')
        .collection(
            Provider.of<PokemonData>(context, listen: false).player.toString())
        .doc('r4Ku5BJqSKiLdSgvi3NI')
        .get();

    } */
    return Column(children: [
      TextButton(
        onPressed: () {
          print('Button pressed');
          /* compareValues(); */
        },
        child: Text(
          'Power: ${pokemon.power}',
          style: TextStyle(
            fontFamily: 'Silkscreen',
            color: Colors.white,
          ),
        ),
      ),
      TextButton(
        onPressed: () => print('Button pressed'),
        child: Text(
          'Size: ${pokemon.size}',
          style: TextStyle(
            fontFamily: 'Silkscreen',
            color: Colors.white,
          ),
        ),
      ),
      TextButton(
        onPressed: () => print('Button pressed'),
        child: Text(
          'Health: ${pokemon.health}',
          style: TextStyle(
            fontFamily: 'Silkscreen',
            color: Colors.white,
          ),
        ),
      ),
      TextButton(
        onPressed: () => print('Button pressed'),
        child: Text(
          'Endurance: ${pokemon.endurance}',
          style: TextStyle(
            fontFamily: 'Silkscreen',
            color: Colors.white,
          ),
        ),
      )
    ]);
  }
}
