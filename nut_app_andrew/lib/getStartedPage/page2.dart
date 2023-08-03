import 'package:flutter/material.dart';
import 'package:nut_app_andrew/config/constants.dart' as constants;

class GetStarted2 extends StatefulWidget {
  const GetStarted2({Key? key}) : super(key: key);

  @override
  State<GetStarted2> createState() => _GetStarted2State();
}

class _GetStarted2State extends State<GetStarted2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(constants.SAFEAREA_ALLINSETS),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(children: [
          const Text('What is your name?'),
          const TextField(),
          ElevatedButton(onPressed: () {}, child: const Text('Next'))
        ]),
      ),
    );
  }
}
