import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/player.dart';

class ColorOption extends StatelessWidget {
  final Color color;
  final bool selected;

  const ColorOption({
    Key? key,
    required this.color,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Consumer<PlayerAvatar>(
        builder: (context, avatar, _) => ElevatedButton(
          child: const SizedBox.square(
            dimension: 50.0,
          ),
          onPressed: () => avatar.color = color,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(color),
            shape: MaterialStateProperty.all<CircleBorder?>(
              CircleBorder(
                side: BorderSide(
                  width: selected ? 6.0 : 0.0,
                ),
              ),
            ),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
    );
  }
}
