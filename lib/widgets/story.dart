// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:insta_ui_clone/pages/more_stories.dart';
import 'package:story_view/story_view.dart';

final storyController = StoryController();

Widget storyView(List image, List names) {
  return SizedBox(
    height: 110,
    child: Row(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            // width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple,
                                    Colors.pink,
                                    Colors.yellow,
                                  ],
                                ),
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              // backgroundColor: Colors.transparent,
                              foregroundImage: NetworkImage(image[index]),
                              radius: 38,
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 58,
                            child: Icon(
                              CupertinoIcons.add_circled_solid,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(names[index])
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MoreStories(),
                        ),
                      ),
                      child: Container(
                        // width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.pink,
                                Colors.yellow,
                              ],
                            ),
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          // backgroundColor: Colors.transparent,
                          foregroundImage: NetworkImage(image[index]),
                          radius: 38,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(names[index])
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
