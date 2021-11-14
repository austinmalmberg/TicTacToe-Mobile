import 'dart:math';

import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/game_state.dart';
import 'package:tictactoe/model/player.dart';
import 'package:tictactoe/screen/home/hud.dart';
import 'package:tictactoe/screen/home/tile.dart';

class HomePage extends StatefulWidget {
  final String title;
  final int tilesPerRow;

  const HomePage({
    Key? key,
    required this.title,
    required this.tilesPerRow,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isClearing;

  @override
  void initState() {
    super.initState();

    _isClearing = false;
  }

  void _setClearing(bool value) {
    setState(() {
      _isClearing = value;
    });
  }

  List<Widget> _createTiles(
      BuildContext context, List<PlayerAvatar?> board, double tileDimension) {
    return board
        .mapIndexed((index, _) => Tile(
              index: index,
              dimension: tileDimension,
              isClearing: _isClearing,
              setClearing: _setClearing,
            ))
        .toList();
  }

  Widget _turnIndicator(PlayerAvatar avatar) {
    return Row(
      children: [
        avatar.iconCustom(color: Colors.white),
        const Text(
          ' TO MOVE',
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<GameState>(
        create: (context) => GameState(
          dimension: widget.tilesPerRow,
          avatars: [
            PlayerAvatar(
              iconData: Icons.accessible_forward,
              color: Colors.red,
            ),
            PlayerAvatar(
              iconData: Icons.agriculture,
              color: Colors.blue,
            ),
          ],
        ),
        child: Column(
          children: [
            // App Bar within body to update the color
            Consumer<GameState>(
              builder: (context, gameState, _) => AppBar(
                backgroundColor: gameState.isDraw
                    ? Colors.grey[800]
                    : gameState.activePlayer.color,
                title: gameState.isDraw
                    ? const Text('DRAW')
                    : _turnIndicator(gameState.activePlayer),
                toolbarHeight: 120.0,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                double boardDimension =
                    min(constraints.maxHeight, constraints.maxWidth);

                return Consumer<GameState>(
                  builder: (context, gameState, _) => Wrap(
                    children: _createTiles(context, gameState.board,
                        boardDimension / widget.tilesPerRow),
                  ),
                );
              },
            ),
            const Hud(),
          ],
        ),
      ),
    );
  }
}
