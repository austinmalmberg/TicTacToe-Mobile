import 'package:flutter/cupertino.dart';
import 'package:tictactoe/model/player.dart';
import 'package:tictactoe/model/turn.dart';

class GameState extends ChangeNotifier {
  final int dimension;
  final List<PlayerAvatar> avatars;

  late Turn _turn;
  late List<PlayerAvatar?> _board;
  late Map<PlayerAvatar, int> _scores;
  PlayerAvatar? _winner;

  GameState({required this.dimension, required this.avatars})
      : assert(avatars.length == 2) {
    _init();

    _scores = Map<PlayerAvatar, int>.fromIterable(
      avatars,
      value: (_) => 0,
    );
  }

  void _init() {
    _turn = Turn();

    _board = List<PlayerAvatar?>.filled(dimension * dimension, null);
  }

  /// Resets the game board, winner, and turn.
  void reset() {
    _winner = null;

    _init();

    notifyListeners();
  }

  PlayerAvatar get playerX => avatars[0];
  PlayerAvatar get playerO => avatars[1];

  void updateAvatar(PlayerAvatar old, PlayerAvatar fresh) {
    for (PlayerAvatar avatar in avatars) {
      if (avatar == old) {
        avatar.iconData = fresh.iconData;
        avatar.color = fresh.color;

        notifyListeners();
        break;
      }
    }
  }

  List<PlayerAvatar?> get board => _board;

  bool get xTurn => _turn.xTurn;
  PlayerAvatar get activePlayer => xTurn ? playerX : playerO;

  int getScore(PlayerAvatar p) => _scores[p]!;

  PlayerAvatar? get winner => _winner;
  bool get hasWinner => winner != null;
  bool get isDraw => !hasWinner && board.every((element) => element != null);

  /// Places a piece on the game board, updates the turn and returns the piece that was placed.
  void placePlayer(int index) {
    // Do not permit placing pieces in non-empty tiles.
    if (_board[index] != null) return;

    _board[index] = activePlayer;
    if (_testWinner(activePlayer)) {
      _winner = activePlayer;

      _scores.update(activePlayer, (value) => value + 1);
    }

    _turn.update();

    notifyListeners();
  }

  PlayerAvatar? playerAt(int index) {
    return _board[index];
  }

  bool _testWinner(PlayerAvatar player) {
    List<Function(PlayerAvatar)> tests = [
      _horizontalWin,
      _verticalWin,
      _diagonalWin,
      _inverseDiagonalWin,
    ];

    return tests.any((test) => test(player));
  }

  bool _horizontalWin(PlayerAvatar p) {
    List<Set<int>> rows = List.generate(
      dimension,
      (i) => List.generate(dimension, (j) => dimension * i + j).toSet(),
    );

    for (Set<int> row in rows) {
      if (_every(row, p)) return true;
    }

    return false;
  }

  bool _verticalWin(PlayerAvatar p) {
    // TODO: make dynamic
    List<Set<int>> columns = [
      {0, 3, 6},
      {1, 4, 7},
      {2, 5, 8},
    ];

    for (Set<int> column in columns) {
      if (_every(column, p)) return true;
    }

    return false;
  }

  bool _diagonalWin(PlayerAvatar p) {
    // TODO: make dynamic
    return _every({0, 4, 8}, p);
  }

  bool _inverseDiagonalWin(PlayerAvatar p) {
    // TODO: make dynamic
    return _every({2, 4, 6}, p);
  }

  bool _every(Set<int> set, PlayerAvatar? p) {
    return set.map((i) => _board[i]).every((player) => player == p);
  }
}
