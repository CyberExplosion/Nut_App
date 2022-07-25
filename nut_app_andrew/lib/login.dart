import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).colorScheme.background.toString());
    return Theme(
      data: Theme.of(context)
          .copyWith(scaffoldBackgroundColor: kNutBackgroundBlue),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/newnut.png',
                    width: 563,
                    height: 317,
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    'Nut',
                    style: GoogleFonts.russoOne(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.w400,
                      fontSize: 144,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
