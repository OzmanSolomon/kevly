import 'package:flutter/material.dart';
import 'package:kyveli/widgets/loading.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ProductDetialsProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<Widget> imageSliders;
  int current = 0;
  Map product = {
    'name': 'Puffy Shoulders Blazer',
    'image': '',
    'silder_images': [
      'assets/images/verticalView1.png',
      'assets/images/verticalView2.png',
      'assets/images/verticalView3.png',
    ],
    'status': 'In Stock',
    'price': '68.88',
    'discount': '48.19',
    'disc':
        'Step your blazer game up with this oversized blazer. Pair it with your outfit of the day for a more chic look….',
    'attrbute': {
      'sizes': [
        {'lable': 'XS', 'value': 'XS'},
        {'lable': 'M', 'value': 'M'},
        {'lable': 'XL', 'value': 'XL'},
        {'lable': 'S', 'value': 'S'},
        {'lable': 'L', 'value': 'L'},
      ],
      'colors': [
        {'lable': 'White', 'value': '#FFFFFF'},
        {'lable': 'Yellow', 'value': '#FFE764'},
        {'lable': 'Black', 'value': '#000000'},
        {'lable': 'Green', 'value': '#11AA6F'},
        {'lable': 'Red', 'value': '#C30404'},
        {'lable': 'Purple', 'value': '#993DDD'},
        {'lable': 'Blue', 'value': '#0497C3'},
        {'lable': 'Pink', 'value': '#FF48C7'},
      ]
    },
    'suggestions': [
      {
        'name': 'Dior-ID Sneaker',
        'discount': '52.65',
        'price': '68.88',
        'image': ''
      },
      {
        'name': 'White Pant',
        'discount': '83.56',
        'price': '133.21',
        'image': ''
      }
    ]
  };
  void setSlider(width) {
    List<String> myList = product['silder_images'];
    imageSliders = myList
        .map((item) => ContainerResponsive(
              width: width,
              height: 532,
              child: Image.asset(
                item,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }

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
