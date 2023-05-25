import 'package:dating_app/component/ComponentText.dart';

import 'package:dating_app/model/ModelDiscoveryPeople.dart';
import 'package:dating_app/page/PagePerkenalan.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  List<ModelDiscoveryPeople> listPeople = [
    ModelDiscoveryPeople("Jessica Parker", "Profesional Model", "23", "3km",
        "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Emily Johnson", "Graphic Designer", "28", "5km",
        "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Sophia Thompson", "Software Engineer", "25", "2km",
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople(
      "Bella",
      "Profession 2",
      "Age 2",
      "Distance 2",
      "https://images.unsplash.com/photo-1601762603339-fd61e28b698a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZhc2hpb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople(
      "Catherine",
      "Profession 3",
      "Age 3",
      "Distance 3",
      "https://images.unsplash.com/photo-1664575602554-2087b04935a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d29tYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople(
      "Danielle",
      "Profession 4",
      "Age 4",
      "Distance 4",
      "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople(
      "Emily",
      "Profession 5",
      "Age 5",
      "Distance 5",
      "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ),
    ModelDiscoveryPeople("Olivia Wilson", "Photographer", "30", "8km",
        "https://plus.unsplash.com/premium_photo-1674069719655-7289402d71e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Ava Anderson", "Fashion Designer", "26", "4km",
        "https://images.unsplash.com/photo-1621784563330-caee0b138a00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Mia Thompson", "Marketing Specialist", "27", "6km",
        "https://images.unsplash.com/photo-1621086893822-ca4d5a70bf36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjZ8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Lily Davis", "Architect", "24", "1km",
        "https://images.unsplash.com/photo-1524504542391-127872011665?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAxfHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("John Doe", "Actor", "32", "2km",
        "https://images.unsplash.com/photo-1639526658732-ac7fdbfcf4db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGhpamFifGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Jane Smith", "Artist", "29", "7km",
        "https://images.unsplash.com/photo-1574297500578-afae55026ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGlqYWJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Michael Johnson", "Fitness Trainer", "31", "4km",
        "https://images.unsplash.com/photo-1571423483570-eb27018d1ec0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fGFzaWElMjBnaXJsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Emily Brown", "Musician", "27", "6km",
        "https://images.unsplash.com/photo-1622651795594-aabc6cf90a54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGhpamFifGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Daniel Davis", "Chef", "35", "3km",
        "https://images.unsplash.com/photo-1475823678248-624fc6f85785?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGFzaWElMjBnaXJsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Olivia Wilson", "Interior Designer", "30", "8km",
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("David Martinez", "Doctor", "38", "5km",
        "https://plus.unsplash.com/premium_photo-1674069719655-7289402d71e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Sophie Johnson", "Fashion Stylist", "26", "4km",
        "https://images.unsplash.com/photo-1621784563330-caee0b138a00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Liam Wilson", "Photographer", "29", "6km",
        "https://images.unsplash.com/photo-1621086893822-ca4d5a70bf36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjZ8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Emma Davis", "Software Engineer", "24", "1km",
        "https://images.unsplash.com/photo-1524504542391-127872011665?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAxfHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Matthew Wilson", "Architect", "32", "3km",
        "https://images.unsplash.com/photo-1541182388496-ac92a3230e4c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTMwfHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Sophia Thompson", "Graphic Designer", "27", "5km",
        "https://images.unsplash.com/photo-1526413232644-8a40f03cc03b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTU2fHxtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
    ModelDiscoveryPeople("Ethan Davis", "Marketing Specialist", "28", "2km",
        "https://images.unsplash.com/photo-1534083220759-4c3c00112ea0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YXNpYSUyMGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
  ];

  @override
  void initState() {
    for (int i = 0; i < listPeople.length; i++) {
      _swipeItems.add(SwipeItem(
          content: ModelDiscoveryPeople(
              listPeople[i].namePeople,
              listPeople[i].job,
              listPeople[i].age,
              listPeople[i].distance,
              listPeople[i].imgProfile),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${listPeople[i].namePeople}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${listPeople[i].namePeople}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${listPeople[i].namePeople}"),
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
                        teks: "Discover",
                        size: SizeApp.SizeTextHeader.sp,
                      ),
                      ComponentTextPrimaryDescriptionRegular(
                        teks: "BTEC FPT",
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.network(
                              _swipeItems[index].content.imgProfile,
                              width: 300.w,
                              fit: BoxFit.cover,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ComponentTextPrimaryTittleBold(
                                    teks: _swipeItems[index]
                                            .content
                                            .namePeople +
                                        ", ${_swipeItems[index].content.age}",
                                    colorText: Colors.white,
                                    size: SizeApp.SizeTextHeader.sp,
                                  ),
                                  ComponentTextPrimaryTittleRegular(
                                    teks: _swipeItems[index].content.job,
                                    colorText: Colors.white,
                                    size: SizeApp.SizeTextDescription.sp,
                                  ),
                                ],
                              ),
                            ),
                          )
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
                          iconSize: 70,
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
