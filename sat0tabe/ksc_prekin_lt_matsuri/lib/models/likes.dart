import 'package:flutter/material.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Likes extends ChangeNotifier {
  final List<int> _likeItems = [];

  List<int> get items => _likeItems;

  void add(int itemNo) {
    _likeItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _likeItems.remove(itemNo);
    notifyListeners();
  }
}
