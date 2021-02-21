import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/checkout/checkout.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class FinalCheckout extends StatefulWidget {
  @override
  _FinalCheckoutState createState() => _FinalCheckoutState();
}

class _FinalCheckoutState extends State<FinalCheckout> {
  @override
  void initState() {
    super.initState();
  }

  final SlidableController slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ResponsiveWidgets.init(
      context,
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
    );
    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
      child: Scaffold(
        appBar: CustomAppbar(
          showClearBtn: false,
          hideFilter: true,
          productList:
              Provider.of<BagProvider>(context, listen: false).bagItems,
          title: 'Final Checkout',
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer<BagProvider>(
                          builder: (context, provider, child) {
                        return Column(
                          children: [productWidget(provider), slider(provider)],
                        );
                      }),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Provider.of<BagProvider>(context, listen: false)
                                      .promoCode !=
                                  null &&
                              Provider.of<BagProvider>(context, listen: false)
                                  .promoCode
                                  .isNotEmpty
                          ? ContainerResponsive(
                              alignment: Alignment.center,
                              color: Color(0xffF7F8F8),
                              width: 375,
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ContainerResponsive(
                                    padding: EdgeInsetsResponsive.all(8),
                                    margin:
                                        EdgeInsetsResponsive.only(bottom: 28),
                                    width: 325,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextResponsive(
                                          'PROMO CODE',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextResponsive(
                                          Provider.of<BagProvider>(context,
                                                  listen: false)
                                              .promoCode,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          TextResponsive(
                            'ADDRESS',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBoxResponsive(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          Consumer<BagProvider>(
                              builder: (context, provider, child) {
                            return TextResponsive(
                              provider.address,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff666E74),
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w300),
                            );
                          }),
                        ],
                      ),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          TextResponsive(
                            'Delivery',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBoxResponsive(
                        height: 5,
                      ),
                      Consumer<BagProvider>(
                          builder: (context, provider, child) {
                        List methodsList = provider.deliveryMethods;
                        int index =
                            methodsList.indexOf(provider.deliveryMethod);
                        return GestureDetector(
                          onTap: () => provider.onSelectMethod(
                              method: methodsList[index]),
                          child: Container(
                            height: 70,
                            width: width,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextResponsive(
                                        methodsList[index]['name'],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w300),
                                      ),
                                      TextResponsive(
                                        '(' + methodsList[index]['time'] + ')',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: TextResponsive(
                                    '\$' + methodsList[index]['cost'],
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          TextResponsive(
                            'PAYMENT METHOD',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBoxResponsive(
                        height: 5,
                      ),
                      Consumer<BagProvider>(
                          builder: (context, provider, child) {
                        int index = provider.paymentMethods
                            .indexOf(provider.paymentMethod);
                        String cardPic;
                        switch (provider.paymentMethods[index]['type']) {
                          case 'amex':
                            cardPic = 'assets/images/amex.png';
                            break;
                          case 'master':
                            cardPic = 'assets/images/master.png';

                            break;
                          case 'paypal':
                            cardPic = 'assets/images/paypal.png';

                            break;
                          case 'visa':
                            cardPic = 'assets/images/visa.png';

                            break;
                          default:
                        }
                        return Container(
                          height: 70,
                          width: width - 20,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 1)),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset(cardPic),
                              ),
                              Center(
                                child: TextResponsive(
                                  provider.paymentMethods[index]['cardNumber']
                                              .length >
                                          8
                                      ? provider.paymentMethods[index]
                                              ['cardNumber']
                                          .replaceRange(
                                              0, 8, '• • • • • • • • ')
                                      : provider.paymentMethods[index]
                                          ['cardNumber'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container()
                            ],
                          ),
                        );
                      }),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Center(
                        child: Consumer<BagProvider>(
                            builder: (context, provider, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              provider.promoCodeApplied
                                  ? TextResponsive(
                                      'Total  ' +
                                          provider.total.toStringAsFixed(2) +
                                          ' USD',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: appTheme().accentColor,
                                          fontSize: 10,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300),
                                    )
                                  : Container(),
                              TextResponsive(
                                provider.promoCodeApplied
                                    ? 'Total  ' +
                                        provider.totalDiscount
                                            .toStringAsFixed(2) +
                                        ' USD'
                                    : 'Total  ' +
                                        provider.total.toStringAsFixed(2) +
                                        ' USD',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBoxResponsive(
                                height: 5,
                              ),
                              TextResponsive(
                                '*VAT Included',
                                style: TextStyle(
                                    color: Color(0xff8D8D8D),
                                    fontSize: 14,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          );
                        }),
                      ),
                      SizedBoxResponsive(
                        height: 75,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context, SlideTopRoute(page: Checkout())),
                          child: ContainerResponsive(
                            padding: EdgeInsetsResponsive.all(8),
                            width: 325,
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextResponsive(
                                  'BUY ITEMS',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBoxResponsive(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Container slider(BagProvider provider) {
    return Container(
      height: 150,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsetsResponsive.only(top: 0, right: 0, left: 0),
          itemCount: provider.bagItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => provider.selectFinalCheckoutSliderIndex(index),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        provider.bagItems[index]['img'],
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 44,
                      height: 4,
                      color: provider.finalCheckoutSliderIndex == index
                          ? Theme.of(context).accentColor
                          : Colors.white,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding productWidget(BagProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Row(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: new BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.asset(
                provider.bagItems[provider.finalCheckoutSliderIndex]['img'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBoxResponsive(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 90,
                      child: TextResponsive(
                        provider.bagItems[provider.finalCheckoutSliderIndex]
                            ['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxResponsive(
                height: 5,
              ),
              TextResponsive(
                provider.bagItems[provider.finalCheckoutSliderIndex]['desc'],
                style: TextStyle(
                    color: Color(0xff8D8D8D),
                    fontSize: 10,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  Container(
                    height: 33,
                    width: 33,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.black, width: 1)),
                    alignment: Alignment.center,
                    child: TextResponsive(
                      provider.bagItems[provider.finalCheckoutSliderIndex]
                          ['size'],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => provider
                        .decreaseQuantity(provider.finalCheckoutSliderIndex),
                    child: TextResponsive(
                      '<',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextResponsive(
                    '${provider.bagItems[provider.finalCheckoutSliderIndex]['quantity']}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () => provider
                        .increaseQuantity(provider.finalCheckoutSliderIndex),
                    child: TextResponsive(
                      '>',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxResponsive(
                    width: 20,
                  ),
                  TextResponsive(
                    '${provider.quantity}' +
                        ' X ' +
                        provider.bagItems[provider.finalCheckoutSliderIndex]
                            ['discount'] +
                        ' USD',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBoxResponsive(
                    width: 5,
                  ),
                  TextResponsive(
                    '${provider.quantity * double.parse(provider.bagItems[provider.finalCheckoutSliderIndex]['discount'])}' +
                        ' USD',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBoxResponsive(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
