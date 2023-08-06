import 'package:flutter/material.dart';
import 'package:nut_app_andrew/color.dart';
import 'package:nut_app_andrew/config/constants.dart' as constants;

class GetStarted1 extends StatelessWidget {
  const GetStarted1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: constants.SAFEAREA_ALLINSETS),
      child: Scaffold(
        backgroundColor: kNutBackgroundBlue,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const SizedBox(
                    //   height: 56,
                    // ),
                    SizedBox(
                        child: Text('Nut',
                            style: Theme.of(context).textTheme.titleLarge)),
                    Image.asset(
                      'assets/femaleWorkout.png',
                      width: 200,
                      // height: 376,
                    ),
                    SizedBox(
                      width: 296,
                      child: Text(
                        'Nut is your opportunity to a healthier lifestyle',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 115,
                    // ),
                    SizedBox(
                      width: 345,
                      // height: 40,
                      child: OutlinedButton(
                        onPressed: () {
                          if (context.mounted) {
                            Navigator.pushNamed(
                                context, '/getStartedPage/page2');
                          }
                        },
                        child: Text(
                          'Get Started',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
