import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nut_app_andrew/widgets/sign_up_fed.dart';
import 'package:nut_app_andrew/config/constants.dart' as constants;
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
    var paint = Paint()..color = kNutBackgroundBlue.withAlpha(40);
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
    // double screenHeight = MediaQuery.of(context).size.height;

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
        // Use slivers for easy managing of flexible inside scrolling
        // https://stackoverflow.com/questions/56326005/how-to-use-expanded-in-singlechildscrollview
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      //Stack need to be wrap in a container and the container needs to have define height
                      clipBehavior: Clip.antiAlias,
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
                      ],
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 0.65 * screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Email',
                                  style: Theme.of(context).textTheme.labelSmall,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      filled: true,
                                      hintText: 'youremail@gmail.com',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Password',
                                  style: Theme.of(context).textTheme.labelSmall,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                child: TextField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  controller: _passwdController,
                                  decoration: const InputDecoration(
                                      filled: true,
                                      hintText: 'Your Password',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Confirm Password',
                                  style: Theme.of(context).textTheme.labelSmall,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                child: TextField(
                                  controller: _secondPasswdController,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                      filled: true,
                                      hintText: 'Your Password',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always),
                                ),
                              ),
                            ],
                          ),
                          // Flexible(
                          //   flex: 3,
                          //   child: Container(),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: SizedBox(
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
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: _emailController.text,
                                                password:
                                                    _passwdController.text);

                                        // TODO: Load the user information through here
                                        if (context.mounted) {
                                          _emailController.clear();
                                          _passwdController.clear();
                                          _secondPasswdController.clear();
                                          Navigator.pushNamed(
                                              context, '/getStartedPage');
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          print("The password is too weak");
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          print(
                                              "The account already exists for that email");
                                        } else if (e.code == 'invalid-email') {
                                          print(
                                              'The email is already been used');
                                        }
                                      } catch (e) {
                                        print(e);
                                      }

                                      // Navigator.pushNamed(context, '/getStartedPage/page1');
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Flexible(
                      child: SignInFederation(
                          dividerString: "or sign up with",
                          btnWidthSize: 0.65 * screenWidth),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
