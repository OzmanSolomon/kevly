import 'package:flutter/material.dart';
import 'package:kyveli/views/collections/collections.dart';
import 'package:provider/provider.dart';

import 'bottomNavProvider.dart';

class DrawerProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<String> items = [
    'NEW',
    'Collection',
    'SALE',
    'ELITE collection',
    'ACCOUNT',
    'Settings',
    'Gift Card',
    'Book appointment'
  ];
  void navigationPage(context, index) {
    if (index == 3 || index == 2) {
      Navigator.pop(context);
      Provider.of<BottomNavProvider>(context, listen: false)
          .bottomTapped(index == 3 ? 1 : 2);
    } else if (index == 1) {
      Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return CustomCollectionView();
            }),
      );
    }
  }
}
