import 'package:flutter/material.dart';

class GetStarted2 extends StatefulWidget {
  const GetStarted2({Key? key}) : super(key: key);

  @override
  State<GetStarted2> createState() => _GetStarted2State();
}

class _GetStarted2State extends State<GetStarted2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Text('What is your name?'),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text('Next'))
        ]),
      ),
    );
  }
}
