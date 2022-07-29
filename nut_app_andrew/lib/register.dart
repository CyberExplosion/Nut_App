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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      // child: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            // left: -19.86 / 100 * screenWidth,
            // top: -18.03 / 100 * screenHeight,
            left: 10,
            child: CustomPaint(
              size: Size(456, 480),
              painter: CirclePainter(),
            ),
          ),
          Positioned(
            left: -3.04 / 100 * screenWidth,
            top: 4.32 / 100 * screenHeight,
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
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
            )),
            body: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      label: Text('Email'),
                      hintText: 'youremail@gmail.com',
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      label: Text('Password'),
                      hintText: 'Your Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      label: Text('Confirm Password'),
                      hintText: 'Your Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
                SizedBox(
                  height: 33,
                ),
                SignInFederation(),
              ],
            ),
          ),
        ],
        //),
      ),
    );
  }
}
