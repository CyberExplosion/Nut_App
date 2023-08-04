// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../color.dart';
// 
// 
// Future<UserCredential> signInWithGoogle() async {
//   //create new provider
//   GoogleAuthProvider googleProvider = GoogleAuthProvider();
// 
//   //Once signed in, return credential
//   return await FirebaseAuth.instance.signInWithPopup(googleProvider);
// }
// 
// Future<UserCredential> signInWithFacebook() async {
//   //new provider
//   FacebookAuthProvider facebookProvider = FacebookAuthProvider();
// 
//   ///return user credential
//   return await FirebaseAuth.instance.signInWithPopup(facebookProvider);
// }
// 
// class SignInFederation extends StatefulWidget {
//   const SignInFederation({Key? key}) : super(key: key);
// 
//   @override
//   State<SignInFederation> createState() => _SignInFederationState();
// }
// 
// class _SignInFederationState extends State<SignInFederation> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const Expanded(
//               child: Divider(
//                 color: Colors.black,
//                 thickness: 1,
//                 indent: 11,
//                 endIndent: 8.5,
//               ),
//             ),
//             Text('or login with',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodySmall!
//                     .copyWith(color: Colors.black)),
//             const Expanded(
//               child: Divider(
//                 color: Colors.black,
//                 thickness: 1,
//                 indent: 8.5,
//                 endIndent: 11,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 44,
//         ),
//         SizedBox(
//           width: 228,
//           height: 40,
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: kNutBackgroundBlue)),
//             onPressed: () async {
//               signInWithGoogle().then((value) {
//                 print(value.user.toString());
//               });
//             },
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Image.network(
//                     'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
//                     width: 32,
//                     height: 32,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Text(
//                     'Google',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium!
//                         .copyWith(color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 35,
//         ),
//         SizedBox(
//           width: 228,
//           height: 40,
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: kNutBackgroundBlue)),
//             onPressed: () async {
//               signInWithFacebook();
//             },
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Image.asset(
//                     'assets/btn_facebook.png',
//                     width: 32,
//                     height: 32,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Text(
//                     'Facebook',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium!
//                         .copyWith(color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
