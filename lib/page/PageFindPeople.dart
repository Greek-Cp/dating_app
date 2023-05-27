import 'dart:ui';

import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/controller/ContentController.dart';

import 'package:dating_app/model/ModelDiscoveryPeople.dart';
import 'package:dating_app/page/PagePerkenalan.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class PageFindPeople extends StatefulWidget {
  static String? routeName = "/PageFindPeople";
  @override
  State<PageFindPeople> createState() => _PageFindPeopleState();
}

class _PageFindPeopleState extends State<PageFindPeople> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final controllerContent = Get.put(ContentController());

  @override
  void initState() {
    for (int i = 0;
        i < controllerContent.getModelDiscoveryPeople().length;
        i++) {
      _swipeItems.add(SwipeItem(
          content: ModelDiscoveryPeople(
              controllerContent.getModelDiscoveryPeople()[i].namePeople,
              controllerContent.getModelDiscoveryPeople()[i].job,
              controllerContent.getModelDiscoveryPeople()[i].age,
              controllerContent.getModelDiscoveryPeople()[i].distance,
              controllerContent.getModelDiscoveryPeople()[i].imgProfile),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Liked ${controllerContent.getModelDiscoveryPeople()[i].namePeople}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Nope ${controllerContent.getModelDiscoveryPeople()[i].namePeople}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Superliked ${controllerContent.getModelDiscoveryPeople()[i].namePeople}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {}));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ScreenUtilInit(
          builder: (context, child) {
            return Column(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            .pushNamed(PagePerkenalan.routeName.toString());
                      },
                      color: ColorApp.PrimaryColor,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ComponentTextPrimaryTittleBold(
                        teks: "Cari Pasangan",
                        size: SizeApp.SizeTextHeader.sp,
                      ),
                      ComponentTextPrimaryDescriptionRegular(
                        teks: "Premium",
                        size: SizeApp.SizeTextDescription.sp,
                        colorText: ColorApp.TextSecondaryColor,
                      )
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/ic_setting_config.png"),
                      ),
                      onPressed: () {},
                      color: ColorApp.PrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 400.h,
                child: SwipeCards(
                  matchEngine: _matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Stack(
                        children: [
                          Card(
                            elevation: 30.h,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.network(
                                _swipeItems[index].content.imgProfile,
                                width: 300.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(
                                    0.2), // Atur transparansi di sini
                                borderRadius: BorderRadius.circular(8.0.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    ComponentTextPrimaryDescriptionBold(
                                      teks:
                                          "${_swipeItems[index].content.distance}",
                                      colorText: Colors.white,
                                      size: SizeApp.SizeTextDescription.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.h),
                                        child: ComponentTextPrimaryTittleBold(
                                          teks: _swipeItems[index]
                                                  .content
                                                  .namePeople +
                                              ", ${_swipeItems[index].content.age}",
                                          colorText: Colors.white,
                                          size: SizeApp.SizeTextHeader.sp,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.h),
                                        child:
                                            ComponentTextPrimaryTittleRegular(
                                          teks: _swipeItems[index].content.job,
                                          colorText: Colors.white,
                                          size: SizeApp.SizeTextDescription.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                  onStackFinished: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Stack Finished"),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  itemChanged: (SwipeItem item, int index) {},
                  leftSwipeAllowed: true,
                  rightSwipeAllowed: true,
                  upSwipeAllowed: true,
                  fillSpace: true,
                  likeTag: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: Text('Like'),
                  ),
                  nopeTag: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Text('Nope'),
                  ),
                  superLikeTag: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.orange)),
                    child: Text('Super Like'),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () => {_matchEngine!.currentItem?.nope()},
                        icon: Image.asset("assets/ic_nav_denied.png")),
                    Card(
                      elevation: 15,
                      shadowColor: ColorApp.PrimaryColor,
                      color: ColorApp.PrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.white,
                          iconSize: 50,
                          onPressed: () {
                            _matchEngine!.currentItem?.superLike();
                          },
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () => {_matchEngine!.currentItem?.like()},
                        icon: Image.asset("assets/ic_nav_stras.png")),
                  ],
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
