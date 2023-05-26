import 'package:dating_app/component/ComponentButton.dart';
import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/page/PageBaseNavigation.dart';
import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/page/PageInputPhoneNumber.dart';
import 'package:dating_app/util/ColorApp.dart';
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
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/ic_logo.png",
                width: 120.w,
                height: 120.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              ComponentTextPrimaryTittleBold(
                teks: "Sign up to continue",
              ),
              SizedBox(
                height: 50.h,
              ),
              ComponentButtonPrimary(
                "Continue with email",
                () => {},
                routeName: PageBaseNavigation.routeName.toString(),
              ),
              SizedBox(
                height: 15.h,
              ),
              ComponentButtonSecondary(
                "Use phone number",
                () => {},
                routeName: PageInputPhoneNumber.routeName,
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0.h),
                    child: ComponentTextPrimaryDescriptionRegular(
                      teks: "or sign up \n with",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(15.0.h),
                      child: ImageIcon(
                        AssetImage("assets/facebook.png"),
                        color: ColorApp.PrimaryColor,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(15.0.h),
                      child: ImageIcon(
                        AssetImage("assets/google.png"),
                        color: ColorApp.PrimaryColor,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(15.0.h),
                      child: ImageIcon(
                        AssetImage("assets/apple.png"),
                        color: ColorApp.PrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  ComponentTextPrimaryDescriptionRegular(
                    teks: "Terms of use",
                    colorText: ColorApp.PrimaryColor,
                  ),
                  ComponentTextPrimaryDescriptionRegular(
                    teks: "Privacy Policy",
                    colorText: ColorApp.PrimaryColor,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
