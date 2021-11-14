import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/game_state.dart';
import 'package:tictactoe/screen/home/player_hud.dart';

class Hud extends StatelessWidget {
  const Hud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Consumer<GameState>(
            builder: (context, gameState, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PlayerHud(avatar: gameState.playerX),
                Icon(
                  gameState.xTurn ? Icons.arrow_left : Icons.arrow_right,
                  size: 84.0,
                ),
                PlayerHud(avatar: gameState.playerO),
              ],
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
