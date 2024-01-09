import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';
import 'package:reels_viewer/reels_viewer.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {

  List<ReelModel> reelsList = [
    ReelModel(
      "https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4",
      "James",
      likeCount: 123,
      reelDescription: "Life is better when you're laughing.",
      profileUrl: profileImages.first,
      commentList: [
        ReelCommentModel(
          comment: "Great Video",
          userProfilePic: profileImages.last,
          userName: "Robert",
          commentTime: DateTime.now(),
        ),
      ],
    ),
    ReelModel(
      "https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4",
      "Rahul",
      likeCount: 9101,
      reelDescription: "Life is better.",
      profileUrl: storyImages.first,
      commentList: [
        ReelCommentModel(
          comment: "Nice Video",
          userProfilePic: storyImages.last,
          userName: "Kathie",
          commentTime: DateTime.now(),
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels'),
        // backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: ReelsViewer(
        showAppbar: false,
        reelsList: reelsList,
        onClickMoreBtn: () {},
        onComment: (p0) {},
        onLike: (like) {
          return showBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 200,
              color: Colors.black,
            ),
          );
        },
        onShare: (p0) {},
      ),
    );
  }
}
