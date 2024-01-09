
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier{
  bool _isLiked = false;

  bool get isLiked => _isLiked;

  void onTap(){
    _isLiked =!_isLiked;
    notifyListeners();
  }
}