import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';

class TabPosts extends StatefulWidget {
  const TabPosts({Key? key}) : super(key: key);

  @override
  State<TabPosts> createState() => _TabPostsState();
}

class _TabPostsState extends State<TabPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: postsImages.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              // height: 10,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                // borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    postsImages[index],
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
