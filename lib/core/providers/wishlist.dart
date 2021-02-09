import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final List verticalView = [
    {
      'img': 'assets/images/verticalView1.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390,00'
    },
    {
      'img': 'assets/images/verticalView2.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99,00'
    },
    {
      'img': 'assets/images/verticalView3.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390,00'
    },
    {
      'img': 'assets/images/verticalView4.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99,00'
    },
  ];
}
