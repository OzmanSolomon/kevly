import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/checkout/recipt.dart';
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
                      // Consumer<BagProvider>(
                      //     builder: (context, provider, child) {
                      //   return Column(
                      //     children:
                      //     [
                      productWidget(
                          Provider.of<BagProvider>(context, listen: false)),
                      slider(Provider.of<BagProvider>(context, listen: false)),
                      //     ],
                      // );
                      // }),
                      // SizedBoxResponsive(
                      //   height: 30,
                      // ),
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
                                        AutoSizeText(
                                          'PROMO CODE',
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        AutoSizeText(
                                          Provider.of<BagProvider>(context,
                                                  listen: false)
                                              .promoCode,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(14),
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ContainerResponsive(),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          AutoSizeText(
                            'ADDRESS',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
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
                            return AutoSizeText(
                              provider.address,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(13),
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
                          AutoSizeText(
                            'Delivery',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
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
                          child: ContainerResponsive(
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
                                      AutoSizeText(
                                        methodsList[index]['name'],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(15),
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w300),
                                      ),
                                      AutoSizeText(
                                        '(' + methodsList[index]['time'] + ')',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(13),
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: AutoSizeText(
                                    '\$' + methodsList[index]['cost'],
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(15),
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
                          AutoSizeText(
                            'PAYMENT METHOD',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
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
                        return ContainerResponsive(
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
                                child: Image.asset(
                                  cardPic,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                              ),
                              Center(
                                child: AutoSizeText(
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
                                      fontSize: ScreenUtil().setSp(17),
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              ContainerResponsive()
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
                                  ? AutoSizeText(
                                      'Total  ' +
                                          provider.total.toStringAsFixed(2) +
                                          ' USD',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: appTheme().accentColor,
                                          fontSize: ScreenUtil().setSp(10),
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300),
                                    )
                                  : ContainerResponsive(),
                              AutoSizeText(
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
                                    fontSize: ScreenUtil().setSp(16),
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBoxResponsive(
                                height: 5,
                              ),
                              AutoSizeText(
                                '*VAT Included',
                                style: TextStyle(
                                    color: Color(0xff8D8D8D),
                                    fontSize: ScreenUtil().setSp(14),
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
                              context, SlideTopRoute(page: Recipt())),
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
                                AutoSizeText(
                                  'BUY ITEMS',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(17),
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

  ContainerResponsive slider(BagProvider provider) {
    return ContainerResponsive(
      height: 200,
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
                        height: 120.h,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContainerResponsive(
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
                width: 160.w,
                height: 220.h,
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
                    child: ContainerResponsive(
                      width: 90,
                      child: AutoSizeText(
                        provider.bagItems[provider.finalCheckoutSliderIndex]
                            ['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(14),
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
              AutoSizeText(
                provider.bagItems[provider.finalCheckoutSliderIndex]['desc'] ??
                    '',
                style: TextStyle(
                    color: Color(0xff8D8D8D),
                    fontSize: ScreenUtil().setSp(10),
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w300),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxResponsive(
                    width: 20,
                  ),
                  AutoSizeText(
                    '${provider.quantity}' +
                        ' X ' +
                        provider.bagItems[provider.finalCheckoutSliderIndex]
                            ['discount'] +
                        ' USD',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(12),
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBoxResponsive(
                    width: 5,
                  ),
                  AutoSizeText(
                    '${provider.quantity * double.parse(provider.bagItems[provider.finalCheckoutSliderIndex]['discount'])}' +
                        ' USD',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(12),
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
