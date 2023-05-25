import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/component/ComponentButton.dart';
import 'package:dating_app/model/ModelIntro.dart';
import 'package:dating_app/page/PageFindPeople.dart';

import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PageBaseNavigation.dart';

class PagePerkenalan extends StatefulWidget {
  static String? routeName = "/PagePerkenalann";
  @override
  State<PagePerkenalan> createState() => _PagePerkenalanState();
}

class _PagePerkenalanState extends State<PagePerkenalan> {
  List<ModelIntro> listDataIntro = [
    ModelIntro(
      "Algorithm",
      "Users going through a vetting process to ensure you never match with bots.",
      "https://plus.unsplash.com/premium_photo-1671586882920-8cd59c84cdfe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelIntro(
      "Matches",
      "We match you with people that have a large array of similar interests.",
      "https://images.unsplash.com/photo-1514315384763-ba401779410f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelIntro(
      "Premium",
      "Sign up today and enjoy the first month of premium benefits on us.",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    )
  ];
  int current = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    viewportFraction: 0.75,
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
                  itemCount: listDataIntro.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        listDataIntro[index].imageLink.toString(),
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ComponentTextPrimaryTittleBold(
                  teks: "${listDataIntro[current].HeaderName}",
                  size: SizeApp.SizeTextHeader.sp,
                  colorText: ColorApp.PrimaryColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeApp.SizePaddingHorizontal.sp,
                  ),
                  child: ComponentTextPrimaryDescriptionRegular(
                    teks: "${listDataIntro[current].descriptionName}",
                    textAlign: TextAlign.center,
                    size: SizeApp.SizeTextDescription.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listDataIntro.asMap().entries.map((entry) {
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
                Expanded(child: Text("")),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeApp.SizePaddingHorizontal.sp,
                  ),
                  child: ComponentButtonPrimary(
                    "Create an account",
                    () => {
                      Navigator.of(context)
                          .pushNamed(PageFindPeople.routeName.toString())
                    },
                    routeName: PageBaseNavigation.routeName.toString(),
                    sizeTextButton: SizeApp.SizeTextDescription.sp,
                  ),
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
                      teks: "Sign In",
                      textAlign: TextAlign.center,
                      colorText: ColorApp.PrimaryColor,
                      size: SizeApp.SizeTextDescription.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
