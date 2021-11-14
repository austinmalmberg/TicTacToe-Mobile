import 'package:flutter/material.dart';
import 'package:tictactoe/model/player.dart';

class VictoryScreen extends StatelessWidget {
  final PlayerAvatar victor;

  const VictoryScreen({
    Key? key,
    required this.victor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: victor.color,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            victor.iconCustom(color: Colors.white),
            const Text(
              ' WINS!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
