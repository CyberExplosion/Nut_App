import 'package:flutter/material.dart';
import 'color.dart';
import './widgets/sign_up_fed.dart';
import './config/constants.dart' as constants;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _controllerFadeOut;
  late AnimationController _controllerFadeIn;

  late Animation<double> _animationIn;
  late Animation<double> _animationOut;

  @override
  void initState() {
    ///// TODO: implement initState
    super.initState();
    _controllerFadeOut =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controllerFadeIn =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

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
    ///// TODO: implement dispose
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
          child: const BackLayer(),
        ),
      ],
    );
  }
}

class BackLayer extends StatelessWidget {
  const BackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: constants.SAFEAREA_ALLINSETS),
      child: Scaffold(
        backgroundColor: kLoginBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginPage');
                  },
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
              // const SignInFederation(), //! Add back later
            ],
          ),
        ),
      ),
    );
  }
}

class FrontLayer extends StatelessWidget {
  const FrontLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNutBackgroundBlue,
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
