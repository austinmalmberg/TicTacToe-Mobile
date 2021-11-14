import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/player.dart';
import 'package:tictactoe/screen/player_avatar_settings/color_selector.dart';
import 'package:tictactoe/screen/player_avatar_settings/icon_selector.dart';

class PlayerAvatarSettings extends StatefulWidget {
  final PlayerAvatar avatar;

  const PlayerAvatarSettings({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  State<PlayerAvatarSettings> createState() => _PlayerAvatarSettingsState();
}

class _PlayerAvatarSettingsState extends State<PlayerAvatarSettings> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerAvatar>(
      create: (context) => widget.avatar.copy(),
      child: Consumer<PlayerAvatar>(
        builder: (context, avatar, _) => WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, avatar);

            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  avatar.iconCustom(color: Colors.white),
                  const Text(' SETTINGS')
                ],
              ),
              toolbarHeight: 120.0,
              backgroundColor: avatar.color,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ColorSelector(),
                    const SizedBox(height: 40.0),
                    IconSelector(color: avatar.color),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
