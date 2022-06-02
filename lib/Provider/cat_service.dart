import 'package:pragma_test/Data/Models/cat_model.dart';
import 'package:flutter/material.dart';

class CatService with ChangeNotifier {
  List<Cat> _cat = <Cat>[];
  List<Cat> _catDisplay = <Cat>[];
  int _index = 0;

  List<Cat> get getCat => _cat;
  void setCat(List<Cat> cat) {
    _cat = cat;
  }

  List<Cat> get getCatDisplay => _catDisplay;
  void setCatDisplay(List<Cat> catDisplay) {
    _catDisplay = catDisplay;
  }

  int get getIndex => _index;
  void setIndex(int i) {
    _index = i;
  }
}
