import 'package:flutter/cupertino.dart';
import 'package:tictactoe/model/player.dart';

class Turn extends ChangeNotifier {
  late bool _xTurn;

  Turn() {
    _xTurn = true;
  }

  void update() => _xTurn = !_xTurn;

  bool get xTurn => _xTurn;
  Player get player => xTurn ? Player.X : Player.O;
}
