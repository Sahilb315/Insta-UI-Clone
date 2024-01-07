import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final searchController = TextEditingController();
  List<String> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = storyNames;
    super.initState();
  }

  void _searchFilter(String enteredWord) {
    List<String> results = [];
    if (enteredWord.isEmpty) {
      results = storyNames;
    } else {
      results = storyNames
          .where((element) =>
              element.toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                    // controller: searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      icon: Icon(Icons.search),
                    ),
                    onChanged: (value) => _searchFilter(value),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(
                        profileImages[index],
                      ),
                    ),
                    title: Text(_foundUsers[index]),
                    subtitle: Text(postsNames[index]),
                    trailing: const Icon(CupertinoIcons.minus_circled),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
