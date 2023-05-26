import 'package:dating_app/component/PhoneTextFIeld.dart';
import 'package:dating_app/page/PageBaseNavigation.dart';
import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/page/PageLogin.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/component/ComponentButton.dart';
import 'package:dating_app/model/ModelIntro.dart';

import '../util/ColorApp.dart';

class PageInputPhoneNumber extends StatelessWidget {
  static String? routeName = "/PageInputPhoneNumber";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeApp.SizePaddingHorizontal),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/ic_back.png"),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageLogin.routeName.toString());
                          },
                          color: ColorApp.PrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ComponentTextPrimaryTittleBold(
                            teks: "Login With",
                            size: SizeApp.SizeTextHeader.sp,
                          ),
                          ComponentTextPrimaryDescriptionRegular(
                            teks: "Phone Number",
                            size: SizeApp.SizeTextDescription.sp,
                            colorText: ColorApp.TextSecondaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ComponentTextPrimaryTittleBold(
                    teks: "My mobile",
                    textAlign: TextAlign.start,
                    colorText: Colors.black,
                    size: (SizeApp.SizeTextHeader + 20).sp,
                  ),
                  ComponentTextPrimaryDescriptionRegular(
                    teks:
                        "Please enter your valid phone number. We will send you a 4-digit code to verify your account. ",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  PhoneTextField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  ComponentButtonPrimary(
                    "Continue",
                    () => {},
                    routeName: PageBaseNavigation.routeName.toString(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
