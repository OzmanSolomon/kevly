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
import 'package:kyveli/widgets/loading.dart';

class SalesProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final List verticalView = [
    {
      'img': 'assets/images/verticalView1.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390',
      'attrbute': {
        'sizes': [
          {'lable': 'XS', 'value': 'XS'},
          {'lable': 'M', 'value': 'M'},
          {'lable': 'XL', 'value': 'XL'},
        ],
        'colors': [
          {'lable': 'White', 'value': '#FFFFFF'},
          {'lable': 'Yellow', 'value': '#FFE764'},
          {'lable': 'Black', 'value': '#000000'},
          {'lable': 'Pink', 'value': '#FF48C7'},
        ]
      },
    },
    {
      'img': 'assets/images/verticalView2.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99',
      'attrbute': {
        'sizes': [
          {'lable': 'XS', 'value': 'XS'},
          {'lable': 'M', 'value': 'M'},
        ],
        'colors': [
          {'lable': 'Red', 'value': '#C30404'},
          {'lable': 'Purple', 'value': '#993DDD'},
          {'lable': 'Blue', 'value': '#0497C3'},
          {'lable': 'Pink', 'value': '#FF48C7'},
        ]
      },
    },
    {
      'img': 'assets/images/verticalView3.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390',
      'attrbute': {
        'sizes': [
          {'lable': 'XS', 'value': 'XS'},
          {'lable': 'M', 'value': 'M'},
          {'lable': 'XL', 'value': 'XL'},
        ],
        'colors': [
          {'lable': 'White', 'value': '#FFFFFF'},
          {'lable': 'Blue', 'value': '#0497C3'},
          {'lable': 'Pink', 'value': '#FF48C7'},
        ]
      },
    },
    {
      'img': 'assets/images/verticalView4.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99',
      'attrbute': {
        'sizes': [
          {'lable': 'XS', 'value': 'XS'},
          {'lable': 'M', 'value': 'M'},
        ],
        'colors': [
          {'lable': 'White', 'value': '#FFFFFF'},
          {'lable': 'Pink', 'value': '#FF48C7'},
        ]
      },
    },
  ];

  void navigationPage(context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return OverLayWidgetWithLoader(false);
          }),
    );
  }
}
