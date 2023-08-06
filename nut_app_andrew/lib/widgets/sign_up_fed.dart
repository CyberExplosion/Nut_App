import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../color.dart';

Future<UserCredential> signInWithGoogle() async {
  //create new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  //Once signed in, return credential
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}

Future<UserCredential> signInWithFacebook() async {
  //new provider
  FacebookAuthProvider facebookProvider = FacebookAuthProvider();

  ///return user credential
  return await FirebaseAuth.instance.signInWithPopup(facebookProvider);
}

class SignInFederation extends StatefulWidget {
  final String dividerString;
  final double btnWidthSize;

  const SignInFederation(
      {Key? key, required this.dividerString, required this.btnWidthSize})
      : super(key: key);

  @override
  State<SignInFederation> createState() => _SignInFederationState();
}

class _SignInFederationState extends State<SignInFederation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                indent: 11,
                endIndent: 8.5,
              ),
            ),
            Text(widget.dividerString,
                style: Theme.of(context).textTheme.bodySmall),
            const Expanded(
              child: Divider(
                indent: 8.5,
                endIndent: 11,
              ),
            ),
          ],
        ),
        SizedBox(
          width: widget.btnWidthSize,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: kNutBackgroundBlue)),
                  onPressed: () async {
                    signInWithGoogle().then((value) {
                      print(value.user.toString());
                    });
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/btn_google.png",
                        width: 32,
                        height: 32,
                      ),
                      Center(
                        child: Text(
                          'Google',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 35,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: kNutBackgroundBlue)),
                  onPressed: () async {
                    signInWithFacebook();
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/btn_facebook.png',
                        width: 32,
                        height: 32,
                      ),
                      Center(
                        child: Text(
                          'Facebook',
                          textAlign: TextAlign.center,
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
      ],
    );
  }
}
