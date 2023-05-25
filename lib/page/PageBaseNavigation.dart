import 'package:dating_app/page/PageFindPeople.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageBaseNavigation extends StatefulWidget {
  static String? routeName = "/PageBaseNavigation";
  @override
  State<PageBaseNavigation> createState() => _PageBaseNavigationState();
}

class _PageBaseNavigationState extends State<PageBaseNavigation> {
  List<BottomNavigationBarItem> NavItem = [
    BottomNavigationBarItem(
        backgroundColor: ColorApp.BackgroundNavigationBottomColor,
        icon: ImageIcon(AssetImage("assets/ic_nav_home.png")),
        label: ""),
    BottomNavigationBarItem(
        backgroundColor: ColorApp.BackgroundNavigationBottomColor,
        icon: ImageIcon(AssetImage("assets/ic_nav_history_like.png")),
        label: ""),
    BottomNavigationBarItem(
        backgroundColor: ColorApp.BackgroundNavigationBottomColor,
        icon: ImageIcon(AssetImage("assets/ic_nav_message.png")),
        label: ""),
    BottomNavigationBarItem(
        backgroundColor: ColorApp.BackgroundNavigationBottomColor,
        icon: ImageIcon(AssetImage("assets/ic_nav_people.png")),
        label: ""),
  ];
  List<Widget> ListPage = [
    PageFindPeople(),
    PageFindPeople(),
    PageFindPeople(),
    PageFindPeople(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: ColorApp.ColorSelectedNavigationItem,
        unselectedItemColor: ColorApp.ColorUnSelectedNavigationItem,
        items: NavItem,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
