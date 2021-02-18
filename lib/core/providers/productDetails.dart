import 'package:flutter/material.dart';
import 'package:kyveli/widgets/loading.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ProductDetialsProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<Widget> imageSliders;
  int quantity = 1;
  int current = 0;
  Map selectedColor;
  Map selectedSize;
  get total {
    dynamic discount = product['discount'];
    discount =
        discount != null && discount != '0' ? double.parse(discount) : null;
    dynamic price = product['price'];
    price = price != null && price != '0' ? double.parse(price) : price;
    double myTotal = discount != null ? quantity * discount : quantity * price;
    return '$myTotal';
  }

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

  void onSelectColor({@required color}) {
    selectedColor = selectedColor == color ? null : color;
    notifyListeners();
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

  void onSelectSize({@required size}) {
    selectedSize = selectedSize == size ? null : size;
    notifyListeners();
  }

  increaseQuantity() {
    quantity++;
    notifyListeners();
  }

  decreaseQuantity() {
    quantity--;
    notifyListeners();
  }
}
