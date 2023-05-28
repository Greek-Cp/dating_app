import 'package:dating_app/page/PageBaseNavigation.dart';
import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/page/PageInputPhoneNumber.dart';
import 'package:dating_app/page/PageLogin.dart';
import 'package:dating_app/page/PageOtpCode.dart';
import 'package:dating_app/page/PagePerkenalan.dart';
import 'package:dating_app/page/PageRegister/PageRegister.dart';
import 'package:dating_app/page/PageRegister/PageRegisterDetailAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      initialRoute: PagePerkenalan.routeName.toString(),
      transitionDuration: Duration(seconds: 3),
      defaultTransition: Transition.circularReveal,
      getPages: [
        GetPage(
            name: PagePerkenalan.routeName.toString(),
            page: () => PagePerkenalan()),
        GetPage(
            name: PageFindPeople.routeName.toString(),
            page: () => PageFindPeople()),
        GetPage(
            name: PageBaseNavigation.routeName.toString(),
            page: () => PageBaseNavigation()),
        GetPage(
            name: PagePerkenalan.routeName.toString(),
            page: () => PagePerkenalan()),
        GetPage(name: PageLogin.routeName.toString(), page: () => PageLogin()),
        GetPage(
            name: PageInputPhoneNumber.routeName.toString(),
            page: () => PageInputPhoneNumber()),
        GetPage(
            name: PageOtpCode.routeName.toString(), page: () => PageOtpCode()),
        GetPage(
            name: PageRegister.RouteName.toString(),
            page: () => PageRegister()),
        GetPage(
            name: PageRegisterDetailAccount.routeName.toString(),
            page: () => PageRegisterDetailAccount())
      ],
    );
  }
}
