import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/page/PageLogin.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageChooseInterest extends StatefulWidget {
  static String? routeName = "/PageChooseInterest";

  @override
  State<PageChooseInterest> createState() => _PageChooseInterestState();
}

class ItemInterest {}

class _PageChooseInterestState extends State<PageChooseInterest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Column(
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
                        Get.toNamed(PageChooseInterest.routeName.toString());
                      },
                      color: ColorApp.PrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                ],
              ),
              ComponentTextPrimaryTittleBold(
                teks: "Your Interest",
                size: SizeApp.SizeTextHeader.sp,
              ),
              ComponentTextPrimaryDescriptionRegular(
                teks:
                    "Select a few of your interests and let everyone know what you’re passionate about.",
              ),
              Chip(label: Text("hello"))
            ],
          );
        },
      ),
    );
  }
}
