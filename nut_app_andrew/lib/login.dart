import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nut_app_andrew/config/constants.dart' as constants;
import 'color.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()..color = const Color(kBubbleRegisterColor);
    var paint = Paint()..color = kNutBackgroundBlue.withAlpha(100);
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TapGestureRecognizer _registerLinkRecog;
  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;

    _registerLinkRecog = TapGestureRecognizer()
      ..onTap = () => Navigator.pushNamed(context, '/registerPage');

    return SafeArea(
      minimum: const EdgeInsets.only(top: constants.SAFEAREA_ALLINSETS),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            leading: SizedBox(
          child: IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              weight: 400,
            ),
            onPressed: () {
              _emailController.clear();
              _passwdController.clear();
              Navigator.pop(context);
            },
          ),
        )),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 320,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -150,
                            left: -70,
                            child: CustomPaint(
                              size: const Size(485, 485),
                              painter: CirclePainter(),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: -39,
                            child: Image.asset(
                              'assets/exercise_guy.png',
                              width: 400,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 0.65 * screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                      'Email',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      textAlign: TextAlign.start,
                                    )),
                                SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      hintText: 'youremail@gmail.com',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                      'Password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      textAlign: TextAlign.left,
                                    )),
                                SizedBox(
                                  height: 60,
                                  child: TextField(
                                    controller: _passwdController,
                                    decoration: const InputDecoration(
                                        filled: true,
                                        hintText: 'Your Password'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        print(
                                            'The user trying to reset password is: ${_emailController.text}');
                                        if (_emailController.text.isNotEmpty) {
                                          try {
                                            await FirebaseAuth.instance
                                                .sendPasswordResetEmail(
                                                    email:
                                                        _emailController.text);
                                          } on FirebaseAuthException catch (e) {
                                            print(
                                                "The error is:\n ${e.message}");
                                          }
                                        } else {
                                          print("There is no email in the box");
                                        }
                                      }, // Fix forgot password problem
                                      child: Text(
                                        'Forgot password',
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                fontSize: 14.5,
                                                color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            if (_emailController.text.isEmpty) {
                                              print("Please enter valid email");
                                            } else {
                                              try {
                                                final credential = await FirebaseAuth
                                                    .instance
                                                    .signInWithEmailAndPassword(
                                                        email: _emailController
                                                            .text,
                                                        password:
                                                            _passwdController
                                                                .text);
                                                if (credential.user != null &&
                                                    context.mounted) {
                                                  _emailController.clear();
                                                  _passwdController.clear();
                                                  Navigator.pushNamed(context,
                                                      '/getStartedPage');
                                                }
                                              } on FirebaseAuthException catch (e) {
                                                if (e.code ==
                                                    'user-not-found') {
                                                  print(
                                                      "There is no user with that email");
                                                } else if (e.code ==
                                                    'wrong-password') {
                                                  print(
                                                      "Wrong password for user");
                                                }
                                              }
                                            }
                                          },
                                          child: Text('Login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge))),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Need an account? ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      TextSpan(
                                          text: 'Register',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: kClickableText),
                                          recognizer: _registerLinkRecog)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Flexible(child: Container()),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
