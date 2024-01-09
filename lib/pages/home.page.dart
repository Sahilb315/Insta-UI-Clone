import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/pages/add_post.dart';
import 'package:insta_ui_clone/pages/main_page.dart';
import 'package:insta_ui_clone/pages/profile_page.dart';
import 'package:insta_ui_clone/pages/reels_page.dart';
import 'package:insta_ui_clone/pages/search_page.dart';
import 'package:insta_ui_clone/provider/navigation_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int currentIndex = 0;
  List pages = [
    const MainPage(),
    const SearchPage(),
    const AddPost(),
    const ReelsPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationPageProvider>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(milliseconds: 500),
          indicatorColor: Colors.transparent,
          selectedIndex: value.currentIndex,
          height: 60,
          backgroundColor: Colors.white,
          onDestinationSelected: (val) => value.setIndex(val),
          destinations: const [
            NavigationDestination(
                icon: Icon(CupertinoIcons.house_fill), label: ""),
            NavigationDestination(icon: Icon(CupertinoIcons.search), label: ""),
            NavigationDestination(
                icon: Icon(CupertinoIcons.plus_app), label: ""),
            NavigationDestination(
                icon: ImageIcon(
                  AssetImage("assets/reel.png"),
                  color: Colors.black,
                  size: 27,
                ),
                label: ""),
            NavigationDestination(
                icon: Icon(CupertinoIcons.person_crop_circle), label: ""),
          ],
        ),
        body: pages[value.currentIndex],
      ),
    );
  }
}
