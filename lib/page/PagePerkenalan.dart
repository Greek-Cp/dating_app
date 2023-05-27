import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/component/ComponentButton.dart';
import 'package:dating_app/controller/ContentController.dart';
import 'package:dating_app/model/ModelIntro.dart';
import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/page/PageLogin.dart';

import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PageBaseNavigation.dart';

class PagePerkenalan extends StatefulWidget {
  static String? routeName = "/PagePerkenalann";
  @override
  State<PagePerkenalan> createState() => _PagePerkenalanState();
}

class _PagePerkenalanState extends State<PagePerkenalan> {
  int current = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final controller = Get.put(ContentController());

    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CarouselSlider.builder(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    initialPage: current,
                    height: 400.0,
                    viewportFraction: 0.73,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                    autoPlay: true,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: controller.listDataIntro.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        controller.listDataIntro[index].imageLink.toString(),
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                ComponentTextPrimaryTittleBold(
                  teks: "${controller.listDataIntro[current].HeaderName}",
                  size: SizeApp.SizeTextHeader.sp,
                  colorText: ColorApp.PrimaryColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeApp.SizePaddingHorizontal.sp,
                  ),
                  child: ComponentTextPrimaryDescriptionRegular(
                    teks:
                        "${controller.listDataIntro[current].descriptionName}",
                    textAlign: TextAlign.center,
                    size: SizeApp.SizeTextDescription.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      controller.listDataIntro.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 12.0.w,
                        height: 12.0.h,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0.w, horizontal: 4.0.h),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == entry.key
                                ? ColorApp.DotsColorSelected
                                : ColorApp.DotsColorUnselect),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeApp.SizePaddingHorizontal.sp,
                  ),
                  child: ComponentButtonPrimary(
                    "Create an account",
                    () => {
                      Get.toNamed(PageLogin.routeName.toString()),
                    },
                    routeName: PageLogin.routeName.toString(),
                    sizeTextButton: SizeApp.SizeTextDescription.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ComponentTextPrimaryDescriptionRegular(
                      teks: "Already have an account?",
                      textAlign: TextAlign.center,
                      size: SizeApp.SizeTextDescription.sp,
                    ),
                    ComponentTextPrimaryDescriptionBold(
                      teks: " Sign In",
                      textAlign: TextAlign.center,
                      colorText: ColorApp.PrimaryColor,
                      size: SizeApp.SizeTextDescription.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
