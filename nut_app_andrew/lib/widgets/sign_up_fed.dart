import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../color.dart';

// ! For web only
// Future<UserCredential> signInWithGoogle() async {
//   //create new provider
//   GoogleAuthProvider googleProvider = GoogleAuthProvider();
//
//   //Once signed in, return credential
//   return await FirebaseAuth.instance.signInWithPopup(googleProvider);
// }

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the userCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential?> signInWithFacebook() async {
  //new provider
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status == LoginStatus.success) {
    // Create a credential from access token
    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, returned the user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  return null;
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
                    try {
                      UserCredential results = await signInWithGoogle();
                      print("wat the fuk");
                      print("The playa is: ${results.user.toString()}");
                      // Succeed
                      if (context.mounted) {
                        Navigator.pushNamed(context, '/getStartedPage');
                      }
                    } on FirebaseAuthException catch (e) {
                      print(
                          "The problem is ${e.message} and code is ${e.code}");
                    }
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
                    UserCredential? result = await signInWithFacebook();
                    if (result == null) {
                      print("Log into facebook FAILED");
                    } else {
                      if (context.mounted) {
                        Navigator.pushNamed(context, '/getStartedPage');
                      }
                    }
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
