import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nut_app_andrew/widgets/sign_up_fed.dart';
import 'color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()..color = const Color(kBubbleRegisterColor);
    var paint = Paint()..color = kNutBackgroundBlue;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();
  final _secondPasswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
          top: -167,
          left: -85,
          child: CustomPaint(
            size: const Size(456, 480),
            painter: CirclePainter(),
          ),
        ),
        Positioned(
          top: 5,
          left: -13,
          child: Image.asset(
            'assets/exercise_guy.png',
            width: 313,
            height: 273,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              _emailController.clear();
              _passwdController.clear();
              Navigator.pop(context);
            },
          )),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 338,
                  ),
                  SizedBox(
                    height: 20,
                    width: 0.62 * screenWidth,
                    child: Text(
                      'Email',
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: 0.65 * screenWidth,
                    height: 60,
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          hintText: 'youremail@gmail.com',
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 0.62 * screenWidth,
                    child: Text(
                      'Password',
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 0.65 * screenWidth,
                    height: 60,
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _passwdController,
                      decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Your Password',
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 0.62 * screenWidth,
                    child: Text(
                      'Confirm Password',
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 0.65 * screenWidth,
                    height: 60,
                    child: TextField(
                      controller: _secondPasswdController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Your Password',
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 0.65 * screenWidth,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_emailController.text.isEmpty) {
                            print("Enter a valid email");
                          }
                          if (_passwdController.text !=
                              _secondPasswdController.text) {
                            print('The password is not the same');
                          } else {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwdController.text);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print("The password is too weak");
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    "The account already exists for that email");
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                          Navigator.pushNamed(context, '/getStartedPage/page1');
                        },
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const SignInFederation(),
                  const SizedBox(
                    height: 110,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
      //),
    );
  }
}
