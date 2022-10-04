import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';

class PokemonData extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  int numberOfCards;
  Player player;
  bool turn;
  PokemonData(
      {this.numberOfCards = 5,
      this.player = Player.playerOne,
      this.turn = true}) {
    turnStream();
  }

  void changeNumberOfCards(int value) {
    numberOfCards += value;
    notifyListeners();
  }

  void setPlayer(Player currentPlayer) {
    player = currentPlayer;
    notifyListeners();
  }

  void changeTurnState(bool value) {
    turn = value;
    notifyListeners();
  }

  void turnStream() async {
    await for (var snapshot in _firestore.collection('turn').snapshots()) {
      changeTurnState(snapshot.docs[0].get('GameCreator'));
    }
  }
}
