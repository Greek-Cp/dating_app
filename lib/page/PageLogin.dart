import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageLogin extends StatefulWidget {
  static String? routeName = "/PageLogin";
  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      builder: (context, child) {
        return Column(
          children: [Image.asset("assets/ic_logo.png")],
        );
      },
    );
  }
}
