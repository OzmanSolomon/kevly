import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  Map selectedColor;
  Map selectedSize;
  Map selectedSort;
  List<Map> colors = [
    {'lable': 'White', 'value': '#FFFFFF'},
    {'lable': 'Yellow', 'value': '#FFE764'},
    {'lable': 'Black', 'value': '#000000'},
    {'lable': 'Green', 'value': '#11AA6F'},
    {'lable': 'Red', 'value': '#C30404'},
    {'lable': 'Purple', 'value': '#993DDD'},
    {'lable': 'Blue', 'value': '#0497C3'},
    {'lable': 'Pink', 'value': '#FF48C7'},
  ];
  List<Map> sizes = [
    {'lable': 'XS', 'value': 'XS'},
    {'lable': 'M', 'value': 'M'},
    {'lable': 'XL', 'value': 'XL'},
    {'lable': 'S', 'value': 'S'},
    {'lable': 'L', 'value': 'L'},
  ];
  List<Map> sort = [
    {'lable': 'SALE', 'value': 'SALE'},
    {'lable': 'PRICE low to high', 'value': 'PRICE low to high'},
    {'lable': 'NEW IN', 'value': 'NEW IN'},
    {'lable': 'PRICE high to low', 'value': 'PRICE high to low'},
  ];
  void onSelectColor({@required color}) {
    selectedColor = selectedColor == color ? null : color;
    notifyListeners();
  }

  void onSelectSize({@required size}) {
    selectedSize = selectedSize == size ? null : size;
    notifyListeners();
  }

  void onSelectSort({@required sort}) {
    selectedSort = selectedSort == sort ? null : sort;
    notifyListeners();
  }

  void onClear() {
    selectedColor = null;
    selectedSize = null;
    selectedSort = null;
    notifyListeners();
  }
}
