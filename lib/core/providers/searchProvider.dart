/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Wrote By Osman Suliman in 2021 
 */
import 'package:flutter/material.dart';
import 'package:kyveli/views/filter/productsView.dart';

import 'package:kyveli/widgets/navigations.dart';

class SearchProvider extends ChangeNotifier {
  var searchController = TextEditingController();

  List searchList = [];
  List trendSearchs = ['Leather Jacket', 'Long Dress', 'Jeans', 'Tank Top'];
  List recentSearchs = [
    'Leather Jacket',
  ];
  applySearch(List products, searchKey, context) {
    searchList = products.where((x) {
      return x['name'].contains(searchKey.toLowerCase());
    }).toList();
    recentSearchs.add(searchKey);
    Navigator.push(
        context,
        SlideBottomRoute(
            page: ProductsView(
          productList: searchList,
          title: 'Search',
        )));
  }

  clearHistory() {
    recentSearchs.clear();
    notifyListeners();
  }
}
