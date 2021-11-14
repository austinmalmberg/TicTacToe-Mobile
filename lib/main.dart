import 'package:flutter/material.dart';
import 'package:tictactoe/screen/home/main.dart';
import 'package:tictactoe/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: sharedTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const HomePage(
        title: 'Tic Tac Toe',
        tilesPerRow: 3,
      ),
    );
  }
}
