import 'package:flutter/material.dart';
import 'package:kyveli/core/base/consts.dart';

class BottomNavProvider extends ChangeNotifier {
  PageController pageController = PageController(
    initialPage: bottomNavigationIndex,
    keepPage: false,
  );
  void pageChanged(int index) {
    bottomNavigationIndex = index;
    notifyListeners();
  }

  void bottomTapped(int index) {
    bottomNavigationIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }
}
