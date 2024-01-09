import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';
import 'package:insta_ui_clone/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SearchProvider>(
        builder: (context, provider, child) => Center(
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
                      trailing: const Icon(CupertinoIcons.minus_circled),
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
