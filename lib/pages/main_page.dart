import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';
import 'package:insta_ui_clone/pages/chat_page.dart';
import 'package:insta_ui_clone/widgets/posts.dart';
import 'package:insta_ui_clone/widgets/story.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Icon(
            CupertinoIcons.heart,
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ChatPage())),
            child: const Icon(CupertinoIcons.chat_bubble),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              storyView(storyImages, storyNames),
              const Divider(),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Posts(
                      profileImages: profileImages[index],
                      postImages: postsImages[index],
                      postNames: postsNames[index],
                      likesName: likedNames[index],
                      postLiked: likedPostsImages[index],
                      postLiked2: likedPostsImages[index + 1],
                      postLiked3: likedPostsImages[index + 2],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
