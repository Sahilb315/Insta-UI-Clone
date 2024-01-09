import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';

class TabTagged extends StatefulWidget {
  const TabTagged({Key? key}) : super(key: key);

  @override
  State<TabTagged> createState() => _TabTaggedState();
}

class _TabTaggedState extends State<TabTagged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: storyImages.getRange(0, 5).toList().length,
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
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
