import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: LoginPage(),
    );
  }
}

//TODO: Build the nut app theme

final ThemeData _kNutTheme = _buildNutTheme();
// final ElevatedButtonThemeData _kNutElevatedButton = _buildNutElevatedBtnTheme();

ThemeData _buildNutTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _buildNutTextTheme(base.textTheme),
      scaffoldBackgroundColor: kNutBackgroundBlue,
      colorScheme: base.colorScheme.copyWith(background: kNutBackgroundBlue),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(kNutBackgroundBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kLoginBackground),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))))));
}

TextTheme _buildNutTextTheme(TextTheme base) {
  return base.copyWith(
      titleLarge:
          GoogleFonts.russoOne(fontWeight: FontWeight.w400, fontSize: 144),
      bodyLarge: GoogleFonts.roboto(
          fontWeight: FontWeight.w600, fontSize: 30, color: kLogoText),
      bodyMedium: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 25),
      bodySmall: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15)

      // headline1: base.headline1!.copyWith(
      // color: kLogoText, fontWeight: FontWeight.w600, fontSize: 30)
      );
}


//TODO how the fuk do i make the theme for elevated
// ElevatedButtonThemeData __buildNutElevatedBtnTheme(){
//   final ElevatedButtonThemeData base = ElevatedButtonThemeData();
//   return base.copyWith(
// 
//   )
// }