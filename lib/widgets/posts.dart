// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/provider/post_provider.dart';
import 'package:provider/provider.dart';

class Posts extends StatefulWidget {
  final String profileImages;
  final String postImages;
  final String postNames;
  final String likesName;
  final String postLiked;
  final String postLiked2;
  final String postLiked3;
  const Posts(
      {Key? key,
      required this.profileImages,
      required this.postImages,
      required this.postNames,
      required this.likesName,
      required this.postLiked,
      required this.postLiked2,
      required this.postLiked3})
      : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isLiked = false;
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    foregroundImage: NetworkImage(widget.profileImages),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.postNames),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        // const Divider(),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(widget.postImages),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<PostsProvider>(
            builder: (context, value, child) => 
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => value.onTap(),
                          child: value.isLiked
                              ? const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.red,
                                )
                              : const Icon(CupertinoIcons.heart),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(CupertinoIcons.bubble_left),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            showBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 250,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          height: 60,
                                          width: 500,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade500,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                            child: Text(
                                              "Copy link https://media.istockphoto.com/id/......",
                                              style: TextStyle(
                                                color: Colors.grey.shade100
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/whatsapp.png",
                                                  height: 100,
                                                ),
                                              ),
                                              const Text("Whatsapp"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 17,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/snapchat.jpeg",
                                                  height: 60,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              const Text("Snapchat"),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 21,
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 17,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/facebook.png",
                                                  height: 60,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              const Text("Facebook"),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 21,
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 17,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/X.png",
                                                  height: 60,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              const Text("X"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(CupertinoIcons.paperplane),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      child: isBookmarked
                          ? const Icon(CupertinoIcons.bookmark_fill,
                              color: Colors.black)
                          : const Icon(CupertinoIcons.bookmark),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 47,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.black,
                            foregroundImage: NetworkImage(widget.postLiked),
                          ),
                          Positioned(
                            left: 13,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              foregroundImage: NetworkImage(widget.postLiked2),
                            ),
                          ),
                          Positioned(
                            left: 26,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.green,
                              foregroundImage: NetworkImage(widget.postLiked3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text("Liked by"),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.likesName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text("and"),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      "others",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      widget.postNames,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Nature is so beautiful🌳")
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "View all 6 comments",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "1 day ago",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
