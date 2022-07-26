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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 2),
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
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Register',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(
                height: 64,
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
                    style: Theme.of(context).textTheme.bodyMedium,
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
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        svg_google,
                        Text(
                          'Google',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      '/btn_facebook.png',
                      width: 32,
                      height: 32,
                    ),
                    Text(
                      'Facebook',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
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
                    style: GoogleFonts.russoOne(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.w400,
                      fontSize: 144,
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
