import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/game_state.dart';
import 'package:tictactoe/model/player.dart';
import 'package:tictactoe/screen/player_avatar_settings/main.dart';

class PlayerHud extends StatelessWidget {
  final PlayerAvatar avatar;

  const PlayerHud({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameState>(
      builder: (context, gameState, _) => TextButton(
        child: Container(
          child: Column(
            children: [
              avatar.iconCustom(color: Colors.black),
              Consumer<GameState>(
                builder: (context, gameState, _) => Text(
                  gameState.getScore(avatar).toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          decoration: BoxDecoration(
            color: avatar.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        onPressed: () async {
          PlayerAvatar newAvatar = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerAvatarSettings(avatar: avatar),
            ),
          );

          gameState.updateAvatar(avatar, newAvatar);
        },
      ),
    );
  }
}
