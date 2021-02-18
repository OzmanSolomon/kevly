import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class BagProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> checkoutScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> deliveryScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final checkoutFormKey = GlobalKey<FormState>();
  final deliveryFormKey = GlobalKey<FormState>();
  var deliveryMethod;
  final FocusNode firstNameFocus = FocusNode();
  var firstNameController = TextEditingController();
  final FocusNode lastNameFocus = FocusNode();
  var lastNameController = TextEditingController();
  final FocusNode emailNameFocus = FocusNode();
  var emailNameController = TextEditingController();
  final FocusNode phoneNameFocus = FocusNode();
  var phoneNameController = TextEditingController();
  final FocusNode addressNameFocus = FocusNode();
  var addressNameController = TextEditingController();
  final FocusNode postcodeNameFocus = FocusNode();
  var postcodeNameController = TextEditingController();
  List<DropdownMenuItem<String>> regoins;
  int quantity = 1;
  bool promoCodeApplied = false;
  String region = 'LEBANON';
  var deliveryMethods = [
    {'name': 'EXPRESS', 'time': '24 hrs', 'cost': '15.99'},
    {'name': 'NORMAL', 'time': '7-14 Days', 'cost': '5.99'},
    {'name': 'SEMI-EXPRESS', 'time': '3-4 Days', 'cost': '8.99'},
  ];
  var regoinsList = [
    'LEBANON',
  ];
  final List bagItems = [
    {
      'img': 'assets/images/verticalView1.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.39000',
      'desc': 'Dark Black - Ref. BEI289304',
      'size': 'L',
      'quantity': 1
    },
    {
      'img': 'assets/images/verticalView2.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.9900',
      'desc': 'Dark Black - Ref. BEI289304',
      'size': 'XL',
      'quantity': 1
    },
    {
      'img': 'assets/images/verticalView3.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.39000',
      'desc': 'Dark Black - Ref. BEI289304',
      'size': 'S',
      'quantity': 1
    },
    {
      'img': 'assets/images/verticalView4.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.9900',
      'desc': 'Dark Black - Ref. BEI289304',
      'size': 'M',
      'quantity': 1
    },
  ];
  double get total {
    double myTotal = 0.0;
    bagItems.forEach((item) {
      double discount =
          item['discount'] != null ? double.parse(item['discount']) : null;
      double price = item['price'] != null ? double.parse(item['price']) : null;
      myTotal = discount != null && discount != 0.0
          ? myTotal + discount * item['quantity']
          : myTotal + price * item['quantity'];
    });
    myTotal = deliveryMethod != null
        ? myTotal + double.parse(deliveryMethod['cost'])
        : myTotal;
    return myTotal;
  }

  double get totalDiscount {
    return total - 20;
  }

  List<DropdownMenuItem<String>> getDropRegoin(List _cats) {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < _cats.length; i++) {
      String a = _cats[i];

      items.add(new DropdownMenuItem<String>(
        value: a,
        child: TextResponsive(
          a,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.w300),
        ),
      ));
    }
    return items;
  }

  void setRegions() {
    regoins = getDropRegoin(regoinsList);
  }

  void onSelectMethod({@required method}) {
    deliveryMethod = deliveryMethod == method ? null : method;
    notifyListeners();
  }

  increaseQuantity(index) {
    bagItems[index]['quantity']++;
    quantity++;
    notifyListeners();
  }

  decreaseQuantity(index) {
    bagItems[index]['quantity']--;
    notifyListeners();
  }

  deleteProduct() {
    notifyListeners();
  }

  applyPromo() {
    promoCodeApplied = true;
    notifyListeners();
  }
}
