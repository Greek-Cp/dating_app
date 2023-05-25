import 'package:dating_app/page/PagePerkenalan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PagePerkenalan.routeName.toString(),
      routes: {
        PagePerkenalan.routeName.toString(): (context) => PagePerkenalan(),
      },
    );
  }
}
