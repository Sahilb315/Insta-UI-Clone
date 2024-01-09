import 'package:flutter/material.dart';
import 'package:insta_ui_clone/data/lists.dart';

class SearchProvider extends ChangeNotifier {
  List<String> _foundUsers = storyNames;

  List<String> get foundUsers => _foundUsers;

  void searchFilter(String enteredWord) {
    List<String> results = [];
    if (enteredWord.isEmpty) {
      results = storyNames;
    } else {
      results = storyNames
          .where((element) =>
              element.toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }
    _foundUsers = results;
    notifyListeners();
  }
}
