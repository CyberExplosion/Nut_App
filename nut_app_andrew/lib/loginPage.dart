import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()..color = const Color(kBubbleRegisterColor);
    var paint = Paint()..color = kNutBackgroundBlue;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 250, paint);
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
    final double screenHeight = MediaQuery.of(context).size.height;

    _registerLinkRecog = TapGestureRecognizer()
      ..onTap = () => Navigator.pushNamed(context, '/registerPage');

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: -75,
                left: -70,
                child: CustomPaint(
                  size: const Size(485, 485),
                  painter: CirclePainter(),
                ),
              ),
              Positioned(
                top: 29,
                left: -39,
                child: Image.asset(
                  'assets/exercise_guy.png',
                  width: 423,
                  height: 388,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 507,
                    ),
                    SizedBox(
                        height: 20,
                        width: 0.62 * screenWidth,
                        child: Text(
                          'Email',
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.start,
                        )),
                    SizedBox(
                      width: 0.65 * screenWidth,
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
                        width: 0.62 * screenWidth,
                        child: Text(
                          'Password',
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      width: 0.65 * screenWidth,
                      height: 60,
                      child: TextField(
                        controller: _passwdController,
                        decoration: const InputDecoration(
                            filled: true, hintText: 'Your Password'),
                      ),
                    ),
                    SizedBox(
                      width: 0.65 * screenWidth,
                      child: Row(
                        children: [
                          const Expanded(child: SizedBox()), //Fill the space
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontSize: 14.5,
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: 0.65 * screenWidth,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_emailController.text.isEmpty) {
                                print("Please enter valid email");
                              } else {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwdController.text);
                                  if (credential.user != null) {
                                    Navigator.pushNamed(
                                        context, '/registerPage');
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print("There is no user with that email");
                                  } else if (e.code == 'wrong-password') {
                                    print("Wrong password for user");
                                    //thisisabetch: password
                                  }
                                }
                              }
                            },
                            child: Text('Login',
                                style: Theme.of(context).textTheme.bodyLarge))),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Need an account? ',
                            style: Theme.of(context).textTheme.headlineSmall,
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
