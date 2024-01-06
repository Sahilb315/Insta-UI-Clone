import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';
import 'package:insta_ui_clone/pages/chat_page.dart';
import 'package:insta_ui_clone/widgets/posts.dart';
import 'package:insta_ui_clone/widgets/story.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      bottomNavigationBar: NavigationBar(
        height: 55,
        backgroundColor: Colors.white,
        destinations: const [
          Icon(CupertinoIcons.house_fill),
          Icon(CupertinoIcons.search),
          Icon(CupertinoIcons.plus_app),
          Icon(Icons.camera),
          Icon(CupertinoIcons.person_crop_circle),
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
