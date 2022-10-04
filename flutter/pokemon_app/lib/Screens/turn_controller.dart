import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Screens/home/widgets/text_button_home.dart';

class TurnController {
  final _firestore = FirebaseFirestore.instance;

  Future<bool> getTurn() async {
    final pokemonList = await _firestore.collection('turn').get();

    setTurn();
    return pokemonList.docs[0].data()['GameCreator'];
  }

  Future<void> setTurn() async {
    await _firestore
        .collection('turn')
        .doc('c1Kl1US4zeqGNVVE7QAa')
        .update({'GameCreator': false});
    return;
  }
}
