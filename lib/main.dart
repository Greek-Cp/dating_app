import 'package:dating_app/page/PageBaseNavigation.dart';
import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/page/PagePerkenalan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );
    return MaterialApp(
      initialRoute: PagePerkenalan.routeName.toString(),
      routes: {
        PagePerkenalan.routeName.toString(): (context) => PagePerkenalan(),
        PageFindPeople.routeName.toString(): (context) => PageFindPeople(),
        PageBaseNavigation.routeName.toString(): (context) =>
            PageBaseNavigation()
      },
    );
  }
}
