import 'package:flutter/material.dart';

final colorSeeds = [
  Colors.blueAccent,
  Colors.orangeAccent,
  Colors.lightGreenAccent,
  Colors.black,
  Colors.purpleAccent,
  Colors.deepPurple,
  Colors.yellowAccent,
];

colorSeedToString(int colorSeed) {
  String colorSeedString = '';
  switch (colorSeed) {
    case 0:
      colorSeedString = 'Blue';
      break;
    case 1:
      colorSeedString = 'Orange';
      break;
    case 2:
      colorSeedString = 'Light Green';
      break;
    case 3:
      colorSeedString = 'Black';
      break;
    case 4:
      colorSeedString = 'Purple';
      break;
    case 5:
      colorSeedString = 'Deep Purple';
      break;
    case 6:
      colorSeedString = 'Yellow';
      break;
  }
  return colorSeedString;
}

class CustomTheme {
  late final ThemeData theme;
  final int colorSeed;
  final Brightness brightness;

  CustomTheme({
    this.colorSeed = 0,
    this.brightness = Brightness.light,
  }) : assert(colorSeed >= 0 && colorSeed < colorSeeds.length, 'Color seed must be between 0 and ${colorSeeds.length}.') {
    theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorSeeds[colorSeed],
      brightness: brightness,
    );
  }

  CustomTheme copyWith({
    int? colorSeed,
    Brightness? brightness,
  }) {
    return CustomTheme(
      colorSeed: colorSeed ?? this.colorSeed,
      brightness: brightness ?? this.brightness,
    );
  }
}