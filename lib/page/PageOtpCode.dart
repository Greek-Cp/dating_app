import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/component/OtpCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/ColorApp.dart';

class PageOtpCode extends StatefulWidget {
  static String? routeName = "/PageOtpCode";
  @override
  State<PageOtpCode> createState() => _PageOtpCodeState();
}

class _PageOtpCodeState extends State<PageOtpCode> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage("assets/ic_back.png"),
                  ),
                  onPressed: () {},
                  color: ColorApp.PrimaryColor,
                ),
              ),
              ComponentTextPrimaryTittleBold(
                teks: "00:42",
              ),
              ComponentTextPrimaryDescriptionRegular(
                teks: "Type the verification\ncode\nwe’ve sent you",
                textAlign: TextAlign.center,
              ),
              OtpCodeWidget()
            ],
          );
        },
      ),
    );
  }
}
