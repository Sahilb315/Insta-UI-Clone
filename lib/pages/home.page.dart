import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/pages/add_post.dart';
import 'package:insta_ui_clone/pages/main_page.dart';
import 'package:insta_ui_clone/pages/profile_page.dart';
import 'package:insta_ui_clone/pages/reels_page.dart';
import 'package:insta_ui_clone/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List pages = [
    const MainPage(),
    const SearchPage(),
    const AddPost(),
    const ReelsPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        indicatorColor: Colors.transparent
        ,
        selectedIndex: currentIndex,
        height: 60,
        backgroundColor: Colors.white,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(CupertinoIcons.house_fill), label: ""),
          NavigationDestination(icon: Icon(CupertinoIcons.search), label: ""),
          NavigationDestination(icon: Icon(CupertinoIcons.plus_app), label: ""),
          NavigationDestination(icon: Icon(Icons.camera), label: ""),
          NavigationDestination(
              icon: Icon(CupertinoIcons.person_crop_circle), label: ""),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
