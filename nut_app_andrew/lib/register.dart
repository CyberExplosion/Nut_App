import 'package:flutter/material.dart';
import 'color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.teal;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => Navigator.pop(context),
      )),
      body: Center(
        child: Column(children: [
          Stack(
            children: [
              CustomPaint(
                size: Size(400, 400),
                painter: CirclePainter(),
              ),
              Image.asset(
                'assets/exercise_guy.png',
                width: 313,
                height: 273,
              ),
            ],
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
          ElevatedButton(onPressed: () {}, child: Text('Sign Up'))
        ]),
      ),
    ));
  }
}
