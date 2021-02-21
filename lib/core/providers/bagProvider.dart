import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:kyveli/views/checkout/finalCheckout.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class BagProvider extends ChangeNotifier {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String address = '''Mr John Doe,
Jibran building, Sin el Fil, Mont Liban
2X4W8H''';
  bool isCvvFocused = false;
  int finalCheckoutSliderIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> checkoutScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> deliveryScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final creditFormKey = GlobalKey<FormState>();
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
  var promoCodeController = TextEditingController();
  String promoCode;
  List<DropdownMenuItem<String>> regoins;
  int quantity = 1;
  bool promoCodeApplied = false;
  String gateWayType;
  String region = 'LEBANON';
  Map paymentMethod;
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
  List paymentMethods = [
    {
      'type': 'amex',
      'cardNumber': '123412341234',
      'name': 'Osman Suliman',
      'expiryDate': '12/21',
      'cvv': '123'
    },
    {
      'type': 'master',
      'cardNumber': '123412343454',
      'name': 'Osman Suliman',
      'expiryDate': '12/21',
      'cvv': '123'
    },
    {
      'type': 'paypal',
      'cardNumber': '123412344324',
      'name': 'Osman Suliman',
      'expiryDate': '12/21',
      'cvv': '123'
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

  selectFinalCheckoutSliderIndex(index) {
    finalCheckoutSliderIndex = index;
    notifyListeners();
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

  onSelectGateWay(method) {
    gateWayType = method;
    notifyListeners();
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

  deleteProduct(index) {
    bagItems.removeAt(index);
    notifyListeners();
  }

  deleteGateway(index) {
    paymentMethods.removeAt(index);
    notifyListeners();
  }

  applyPromo() {
    promoCodeApplied = true;
    promoCode = promoCodeController.text;
    notifyListeners();
  }

  saveCard(context) {
    switch (detectCCType(cardNumber)) {
      case CardType.visa:
        gateWayType = 'visa';
        break;

      case CardType.americanExpress:
        gateWayType = 'amex';

        break;

      case CardType.mastercard:
        gateWayType = 'master';

        break;

      case CardType.discover:
        gateWayType = 'discover';

        break;

      default:
        gateWayType = 'visa';

        break;
    }

    Map myCard = {
      'type': gateWayType,
      'cardNumber': cardNumber,
      'name': cardHolderName,
      'expiryDate': expiryDate,
      'cvv': cvvCode
    };
    paymentMethods.add(myCard);
    gateWayType = '';
    cardNumber = '';
    cardHolderName = '';
    expiryDate = '';
    cvvCode = '';
    Navigator.pop(context);
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    notifyListeners();
  }

  Map<CardType, Set<List<String>>> cardNumPatterns =
      <CardType, Set<List<String>>>{
    CardType.visa: <List<String>>{
      <String>['4'],
    },
    CardType.americanExpress: <List<String>>{
      <String>['34'],
      <String>['37'],
    },
    CardType.discover: <List<String>>{
      <String>['6011'],
      <String>['622126', '622925'],
      <String>['644', '649'],
      <String>['65']
    },
    CardType.mastercard: <List<String>>{
      <String>['51', '55'],
      <String>['2221', '2229'],
      <String>['223', '229'],
      <String>['23', '26'],
      <String>['270', '271'],
      <String>['2720'],
    },
  };

  detectCCType(String cardNumber) {
    CardType cardType = CardType.otherBrand;

    if (cardNumber.isEmpty) {
      return cardType;
    }

    cardNumPatterns.forEach(
      (CardType type, Set<List<String>> patterns) {
        for (List<String> patternRange in patterns) {
          String ccPatternStr =
              cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
          final int rangeLen = patternRange[0].length;

          if (rangeLen < cardNumber.length) {
            ccPatternStr = ccPatternStr.substring(0, rangeLen);
          }

          if (patternRange.length > 1) {
            final int ccPrefixAsInt = int.parse(ccPatternStr);
            final int startPatternPrefixAsInt = int.parse(patternRange[0]);
            final int endPatternPrefixAsInt = int.parse(patternRange[1]);
            if (ccPrefixAsInt >= startPatternPrefixAsInt &&
                ccPrefixAsInt <= endPatternPrefixAsInt) {
              cardType = type;
              break;
            }
          } else {
            if (ccPatternStr == patternRange[0]) {
              cardType = type;
              break;
            }
          }
        }
      },
    );
  }

  navigateToFinal(context, index) {
    paymentMethod = paymentMethods[index];
    Navigator.push(context, SlideTopRoute(page: FinalCheckout()));
  }
}
