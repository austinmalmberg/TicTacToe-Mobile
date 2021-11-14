import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/icons.dart';
import 'package:tictactoe/model/player.dart';

class IconSelector extends StatelessWidget {
  final Color? color;

  const IconSelector({Key? key, this.color}) : super(key: key);

  Widget _createTile(IconData iconData, PlayerAvatar avatar) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          color: avatar.iconData == iconData ? color : Colors.grey,
          size: PlayerAvatar.iconSize * 0.9,
        ),
      ),
      onPressed: () => avatar.iconData = iconData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your avatar:',
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        SingleChildScrollView(
          child: Wrap(
            children: appIcons
                .map(
                  (iconData) => Consumer<PlayerAvatar>(
                    builder: (context, avatar, _) =>
                        _createTile(iconData, avatar),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
