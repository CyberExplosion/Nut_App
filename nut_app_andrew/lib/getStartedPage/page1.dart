import 'package:flutter/material.dart';
import 'package:nut_app_andrew/color.dart';
import 'package:nut_app_andrew/config/constants.dart' as constants;

class GetStarted1 extends StatelessWidget {
  const GetStarted1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(constants.SAFEAREA_ALLINSETS),
      child: Scaffold(
        backgroundColor: kNutBackgroundBlue,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 56,
                ),
                Stack(
                  children: [
                    SizedBox(
                        width: 261,
                        child: Text('Nut',
                            style: Theme.of(context).textTheme.titleLarge)),
                    Positioned(
                      top: 100,
                      child: Image.asset(
                        'assets/femaleWorkout.png',
                        width: 261,
                        height: 376,
                      ),
                    ),
                    const SizedBox(height: 488),
                  ],
                ),
                SizedBox(
                  width: 296,
                  child: Text(
                    'Nut is your opportunity to a healthier lifestyle',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 115,
                ),
                SizedBox(
                  width: 345,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/getStartedPage/page2');
                    },
                    child: Text(
                      'Get Started',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
