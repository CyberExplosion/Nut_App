import 'package:flutter/material.dart';
import 'login.dart';
import 'color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nut App',
      theme: _kNutTheme,
      home: const FrontLayer(),
    );
  }
}

//TODO: Build the nut app theme

final ThemeData _kNutTheme = _buildNutTheme();

ThemeData _buildNutTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _buildNutTextTheme(base.textTheme),
      scaffoldBackgroundColor: kNutBackgroundBlue,
      colorScheme: base.colorScheme.copyWith(background: kNutBackgroundBlue));
}

TextTheme _buildNutTextTheme(TextTheme base) {
  return base.copyWith(titleLarge: base.titleLarge!.copyWith(color: kLogoText));
}
