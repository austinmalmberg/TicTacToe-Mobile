import 'package:flutter/material.dart';

enum Player {
  X,
  O,
}

class PlayerAvatar extends ChangeNotifier {
  late IconData _iconData;
  late Color _color;

  static const double iconSize = 60.0;

  Icon get icon => Icon(_iconData, color: color, size: iconSize);

  PlayerAvatar({
    required IconData iconData,
    required Color color,
  }) {
    _iconData = iconData;
    _color = color;
  }

  // color getter and setter
  Color get color => _color;
  set color(Color value) {
    _color = value;

    notifyListeners();
  }

  // iconData getter and setter
  IconData get iconData => _iconData;
  set iconData(IconData value) {
    _iconData = value;

    notifyListeners();
  }

  Icon iconCustom({
    double? size,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) =>
      Icon(
        _iconData,
        size: size ?? iconSize,
        color: color ?? this.color,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );

  PlayerAvatar copy() {
    return PlayerAvatar(color: color, iconData: _iconData);
  }
}
