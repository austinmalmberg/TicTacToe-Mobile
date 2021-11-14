import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/player.dart';
import 'package:tictactoe/screen/player_avatar_settings/color_option.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();

    _colors = Colors.primaries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your color:',
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        SizedBox(
          child: ListView.builder(
            itemCount: _colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Consumer<PlayerAvatar>(
              builder: (context, avatar, _) => ColorOption(
                color: _colors[index],
                selected: avatar.color == _colors[index],
              ),
            ),
          ),
          height: 100.0,
        ),
      ],
    );
  }
}
