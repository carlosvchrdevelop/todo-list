import 'package:flutter/material.dart';

class AppTheme {
  static const red = 'red';
  static const blue = 'blue';
  static const green = 'green';
  static const pink = 'pink';
  static const orange = 'orange';
  static const deepOrange = 'deepOrange';
  static const lime = 'lime';
  static const purple = 'purple';
  static const grey = 'grey';
  static const yellow = 'yellow';
  static const blueGrey = 'blueGrey';

  static const colorKeys = [
    red,
    blue,
    green,
    pink,
    orange,
    deepOrange,
    lime,
    purple,
    grey,
    yellow,
    blueGrey
  ];

  static MaterialColor primary = Colors.blue;

  static MaterialColor getColor(String color) {
    switch (color) {
      case red:
        return Colors.red;
      case blue:
        return Colors.blue;
      case green:
        return Colors.green;
      case pink:
        return Colors.pink;
      case orange:
        return Colors.orange;
      case deepOrange:
        return Colors.deepOrange;
      case lime:
        return Colors.lime;
      case purple:
        return Colors.purple;
      case grey:
        return Colors.grey;
      case yellow:
        return Colors.yellow;
      case blueGrey:
        return Colors.blueGrey;

      default:
        return Colors.blue;
    }
  }
}
