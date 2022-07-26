import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class BackLayer extends StatelessWidget {
  BackLayer({Key? key}) : super(key: key);

  final Widget svg_google = SvgPicture.asset(
    '/btn_google.svg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLoginBackground,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 172),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  '/gym_weight.png',
                  width: 234,
                  height: 217,
                ),
                const SizedBox(
                  height: 86,
                ),
                SizedBox(
                  width: 228,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 228,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: kNutBackgroundBlue)),
                    child: Text('Register',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kNutBackgroundBlue)),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 11,
                        endIndent: 8.5,
                      ),
                    ),
                    Text(
                      'or login with',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 8.5,
                        endIndent: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 44,
                ),
                SizedBox(
                  width: 228,
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: kNutBackgroundBlue)),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Google',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 228,
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: kNutBackgroundBlue)),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            '/btn_facebook.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Facebook',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class FrontLayer extends StatelessWidget {
  const FrontLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    '/newnut.png',
                    width: 563,
                    height: 317,
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Expanded(
                  child: Text(
                    'Nut',
                    style: Theme.of(context).textTheme.titleLarge,
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
