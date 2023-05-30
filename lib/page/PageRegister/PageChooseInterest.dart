import 'package:dating_app/component/ComponentButton.dart';
import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/page/PageLogin.dart';
import 'package:dating_app/page/PageRegister/PageRegisterDetailAccount.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/IconFile.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageChooseInterest extends StatefulWidget {
  static String? routeName = "/PageChooseInterest";

  @override
  State<PageChooseInterest> createState() => _PageChooseInterestState();
}

class ItemInterest {
  String? nameInterest;
  String? imagePath;
  bool selected = false;
  ItemInterest(this.nameInterest, this.imagePath);
}

class _PageChooseInterestState extends State<PageChooseInterest> {
  List<ItemInterest> listInterest = [];

  List<ItemInterest> itemList = [
    ItemInterest("Photography", IconFile.camera),
    ItemInterest("Shopping", IconFile.weixinMarket),
    ItemInterest("Karaoke", IconFile.voice),
    ItemInterest("Yoga", IconFile.viencharts),
    ItemInterest("Cooking", IconFile.noodles),
    ItemInterest("Tennis", IconFile.tennis),
    ItemInterest("Run", IconFile.sport),
    ItemInterest("Swimming", IconFile.ripple),
    ItemInterest("Art", IconFile.platte),
    ItemInterest("Traveling", IconFile.outdoor),
    ItemInterest("Extreme", IconFile.music),
    ItemInterest("Music", IconFile.viencharts),
    ItemInterest("Drink", IconFile.gobletFull),
    ItemInterest("Video games", IconFile.gameHandle),
  ];

  Widget ItemChooser(String? imagePath, String namaInterest, bool selected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: 4.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
          border: Border.all(
            color:
                selected ? ColorApp.PrimaryColor : ColorApp.TextSecondaryColor,
            width: 2.0,
          ),
          color: selected ? ColorApp.PrimaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: selected ? ColorApp.PrimaryColor : Colors.white,
              spreadRadius: 0.0,
              blurRadius: 10,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(imagePath.toString()),
              color: selected ? Colors.white : ColorApp.PrimaryColor,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: ComponentTextPrimaryDescriptionRegular(
                teks: namaInterest,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                colorText: selected ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeApp.SizePaddingHorizontal.w),
            child: SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                            Get.toNamed(
                                PageRegisterDetailAccount.routeName.toString());
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
                  SizedBox(
                    child: GridView.count(
                        childAspectRatio: 3,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: PageScrollPhysics(),
                        children: List.generate(
                            itemList.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (itemList[index].selected == true) {
                                        itemList[index].selected = false;
                                        listInterest.removeWhere((element) =>
                                            element.nameInterest.toString() ==
                                            itemList[index].nameInterest);
                                      } else {
                                        itemList[index].selected = true;
                                        listInterest.add(itemList[index]);
                                      }
                                    });
                                  },
                                  child: ItemChooser(
                                      itemList[index].imagePath,
                                      itemList[index].nameInterest.toString(),
                                      itemList[index].selected),
                                ))),
                  ),
                  ComponentTextPrimaryTittleBold(
                    teks: "Interest Selected",
                    size: SizeApp.SizeTextHeader.sp,
                  ),
                  ComponentTextPrimaryDescriptionRegular(
                    teks: "selected interests",
                  ),
                  Wrap(
                    runAlignment: WrapAlignment.center,
                    children: List.generate(
                        listInterest.length,
                        (index) => Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r)),
                              color: ColorApp.PrimaryColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeApp.SizePaddingHorizontal.h,
                                    vertical: 10.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ImageIcon(
                                      AssetImage(listInterest[index]
                                          .imagePath
                                          .toString()),
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    ComponentTextPrimaryDescriptionRegular(
                                        teks: listInterest[index].nameInterest,
                                        fontWeight: FontWeight.bold,
                                        colorText: Colors.white),
                                  ],
                                ),
                              ),
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: ComponentButtonPrimaryWithFunction(
                        "Continue",
                        () =>
                            {Get.toNamed(PageFindPeople.routeName.toString())}),
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
