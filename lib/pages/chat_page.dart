import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';
import 'package:insta_ui_clone/provider/search_provider.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final searchController = TextEditingController();
  // List<String> _foundUsers = [];

  // @override
  // void initState() {
  //   _foundUsers = storyNames;
  //   super.initState();
  // }

  // void _searchFilter(String enteredWord) {
  //   List<String> results = [];
  //   if (enteredWord.isEmpty) {
  //     results = storyNames;
  //   } else {
  //     results = storyNames
  //         .where((element) =>
  //             element.toLowerCase().contains(enteredWord.toLowerCase()))
  //         .toList();
  //   }

  //   setState(() {
  //     _foundUsers = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    log("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(storyNames.first),
        centerTitle: true,
      ),
      body: Center(
        child: 
        Consumer<SearchProvider>(
          builder: (context, provider, child) {
            log("In Consumer");
            return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        icon: Icon(Icons.search),
                        // suffixIcon: Icon(Icons.search)
                      ),
                      onChanged: (value) => provider.searchFilter(value),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.foundUsers.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(
                          profileImages[index],
                        ),
                      ),
                      title: Text(provider.foundUsers[index]),
                      subtitle: Text(postsNames[index]),
                      trailing: const Icon(CupertinoIcons.camera),
                    );
                  },
                ),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
