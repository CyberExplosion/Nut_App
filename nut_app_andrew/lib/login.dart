import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';
import 'color.dart';

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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
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
                            'assets/btn_facebook.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Facebook',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
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
