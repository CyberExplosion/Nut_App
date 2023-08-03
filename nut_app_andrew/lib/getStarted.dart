import 'package:flutter/material.dart';
import 'package:nut_app_andrew/getStartedPage/page1.dart';
import 'package:nut_app_andrew/getStartedPage/page2.dart';

//TODO: Combine these 2 links to create dots page view
//https://stackoverflow.com/questions/60672934/how-to-scroll-to-the-next-page-pageview-flutter
//https://pub.dev/packages/dots_indicator

class GetStaredPageView extends StatelessWidget {
  const GetStaredPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return PageView(
      controller: controller,
      children: const <Widget>[GetStarted1(), GetStarted2()],
    );
  }
}
