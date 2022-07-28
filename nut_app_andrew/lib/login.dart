import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import './widgets/sign_up_fed.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final double _opacityLevel = 0;
  late AnimationController _controllerFadeOut;
  late AnimationController _controllerFadeIn;

  late Animation<double> _animationIn;
  late Animation<double> _animationOut;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerFadeOut =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _controllerFadeIn =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _controllerFadeOut.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerFadeIn.forward();
      }
    });

    _animationIn = Tween(begin: 0.0, end: 1.0).animate(_controllerFadeIn);
    _animationOut = Tween(begin: 5.0, end: 0.0).animate(_controllerFadeOut);

    _play();
  }

  Future<void> _play() async {
    try {
      await _controllerFadeOut.forward().orCancel;
      await _controllerFadeIn.forward().orCancel;
    } on TickerCanceled {
      //Handle if animation was canceled for whatever reason if you need it
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerFadeOut.dispose();
    _controllerFadeIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerFadeOut.forward();
    return Stack(
      children: [
        FadeTransition(
          opacity: _animationOut,
          child: const FrontLayer(),
        ),
        FadeTransition(
          opacity: _animationIn,
          child: BackLayer(),
        ),
      ],
    );
  }
}

class BackLayer extends StatelessWidget {
  BackLayer({Key? key}) : super(key: key);

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
                  'assets/gym_weight.png',
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerPage');
                    },
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
                const SizedBox(
                  height: 115,
                )
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
                    'assets/newnut.png',
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: kLogoText),
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
