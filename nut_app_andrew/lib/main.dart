import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nut_app_andrew/getStarted.dart';
import 'firebase_options.dart';
import 'package:nut_app_andrew/getStartedPage/page1.dart';
import 'package:nut_app_andrew/login.dart';
import 'package:nut_app_andrew/register.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'getStartedPage/page2.dart';
import 'landing.dart';
import 'color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance
  //     .useAuthEmulator("localhost", 9099); //! For demoing only
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
      routes: {
        '/': (context) => const LandingPage(),
        '/registerPage': (context) => const RegisterPage(),
        '/loginPage': (context) => const LoginPage(),
        '/getStartedPage': (context) => const GetStaredPageView(),
        '/getStartedPage/page2': (context) => const GetStarted2()
      },
    );
  }
}

//TODO: Build the nut app theme

final ThemeData _kNutTheme = _buildNutTheme();
// final ElevatedButtonThemeData _kNutElevatedButton = _buildNutElevatedBtnTheme();

ThemeData _buildNutTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _buildNutTextLightTheme(base.textTheme),
      scaffoldBackgroundColor: kLoginBackground,
      appBarTheme: base.appBarTheme.copyWith(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: kNutBackgroundBlue)),
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
                      borderRadius: BorderRadius.circular(18.0))))),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kNutBackgroundBlue,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))))),
      dividerTheme: const DividerThemeData(color: Colors.black, thickness: 1));
}

TextTheme _buildNutTextLightTheme(TextTheme base) {
  return base.copyWith(
    titleLarge: GoogleFonts.russoOne(
        fontWeight: FontWeight.w400, fontSize: 144, color: kLogoText),
    bodyLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w600, fontSize: 30, color: kLogoText),
    bodyMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w500, fontSize: 25, color: Colors.black),
    bodySmall: GoogleFonts.roboto(
        fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black),
    labelSmall: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 13,
    ),
    labelMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w600, fontSize: 30, color: kNutBackgroundBlue),
    headlineSmall: GoogleFonts.roboto(
        fontWeight: FontWeight.w700, fontSize: 14.5, color: Colors.black),
    headlineMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w700, fontSize: 20, color: kLogoText),
  );
}


//TODO how the fuk do i make the theme for elevated
// ElevatedButtonThemeData __buildNutElevatedBtnTheme(){
//   final ElevatedButtonThemeData base = ElevatedButtonThemeData();
//   return base.copyWith(
// 
//   )
// }