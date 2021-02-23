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

class OrdersHistoryProvider extends ChangeNotifier {
  int orderDetailsSliderIndex = 0;
  List orders = [
    {
      'name': 'Puffy Shoulders Blazer',
      'image': '',
      'products': [
        {
          'img': 'assets/images/verticalView1.png',
          'name': 'Waist Shipping Blouse',
          'price': '68.88',
          'discount': '1.390',
          'quantity': 2,
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
          'quantity': 3,
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
      ],
      'data': 'JULY 10TH 2020',
      'total': 20,
      'totalDiscount': 10,
      'desc': 'mg  kglsf l klmgflkd',
      'size': 'L',
      'quantity': 2,
      'address': '''Mr John Doe,
Jibran building, Sin el Fil, Mont Liban
2X4W8H''',
      'promoCode': 'JSNFOWKL93J',
      'deliveryMethod': {'name': 'EXPRESS', 'time': '24 hrs', 'cost': '15.99'},
      'paymentMethod': {
        'type': 'amex',
        'cardNumber': '123412341234',
        'name': 'Osman Suliman',
        'expiryDate': '12/21',
        'cvv': '123'
      },
    }
  ];
  changeOrderDetailsSliderIndex(index) {
    orderDetailsSliderIndex = index;
    notifyListeners();
  }
}
