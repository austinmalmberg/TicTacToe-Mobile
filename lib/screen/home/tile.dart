import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/game_state.dart';
import 'package:tictactoe/screen/victory/main.dart';

class Tile extends StatelessWidget {
  final int index;
  final double dimension;

  const Tile({
    Key? key,
    required this.index,
    required this.dimension,
  }) : super(key: key);

  void _updateGameState(BuildContext context, GameState gameState) async {
    gameState.placePlayer(index);

    if (gameState.isDraw) {
      // Clear the board after a time.
      Future.delayed(
        const Duration(seconds: 2),
        () => gameState.reset(),
      );
    } else if (gameState.hasWinner) {
      // When there is a winner, display the VictoryScreen.
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VictoryScreen(victor: gameState.winner!),
      ));

      // Reset the game when the VictoryScreen is popped
      gameState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: Container(
        child: Consumer<GameState>(
          builder: (context, gameState, _) => TextButton(
            child: gameState.playerAt(index)?.icon ?? Container(),

            // Disable button when there is a winner.
            onPressed: gameState.hasWinner
                ? null
                : () => _updateGameState(context, gameState),
          ),
        ),

        // Stagger the tile color.
        color: index % 2 == 0
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColorLight,
      ),
    );
  }
}
