import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyveli/core/providers/ordersHistoryProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class OrderDetails extends StatefulWidget {
  final int orderIndex;
  OrderDetails({this.orderIndex});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
                      Consumer<OrdersHistoryProvider>(
                          builder: (context, provider, child) {
                        return Column(
                          children: [productWidget(provider), slider(provider)],
                        );
                      }),
                      SizedBoxResponsive(
                        height: 30,
                      ),
                      Provider.of<OrdersHistoryProvider>(context, listen: false)
                                      .orders[widget.orderIndex]['promoCode'] !=
                                  null &&
                              Provider.of<OrdersHistoryProvider>(context,
                                      listen: false)
                                  .orders[widget.orderIndex]['promoCode']
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
                                          Provider.of<OrdersHistoryProvider>(
                                                      context,
                                                      listen: false)
                                                  .orders[widget.orderIndex]
                                              ['promoCode'],
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
                          Consumer<OrdersHistoryProvider>(
                              builder: (context, provider, child) {
                            return AutoSizeText(
                              provider.orders[widget.orderIndex]['address'],
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
                      Consumer<OrdersHistoryProvider>(
                          builder: (context, provider, child) {
                        return GestureDetector(
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
                                        provider.orders[widget.orderIndex]
                                            ['deliveryMethod']['name'],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(15),
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w300),
                                      ),
                                      AutoSizeText(
                                        '(' +
                                            provider.orders[widget.orderIndex]
                                                ['deliveryMethod']['time'] +
                                            ')',
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
                                    '\$' +
                                        provider.orders[widget.orderIndex]
                                            ['deliveryMethod']['cost'],
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
                      Consumer<OrdersHistoryProvider>(
                          builder: (context, provider, child) {
                        String cardPic;
                        switch (provider.orders[widget.orderIndex]
                            ['paymentMethod']['type']) {
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
                                  provider
                                              .orders[widget.orderIndex]
                                                  ['paymentMethod']
                                                  ['cardNumber']
                                              .length >
                                          8
                                      ? provider.orders[widget.orderIndex]
                                              ['paymentMethod']['cardNumber']
                                          .replaceRange(
                                              0, 8, '• • • • • • • • ')
                                      : provider.orders[widget.orderIndex]
                                          ['paymentMethod']['cardNumber'],
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
                        child: Consumer<OrdersHistoryProvider>(
                            builder: (context, provider, child) {
                          bool promoCodeApplied =
                              provider.orders[widget.orderIndex]['promoCode'] !=
                                      null &&
                                  provider
                                      .orders[widget.orderIndex]['promoCode']
                                      .isNotEmpty;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              promoCodeApplied
                                  ? AutoSizeText(
                                      'Total  ' +
                                          provider.orders[widget.orderIndex]
                                                  ['total']
                                              .toStringAsFixed(2) +
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
                                promoCodeApplied
                                    ? 'Total  ' +
                                        provider.orders[widget.orderIndex]
                                                ['totalDiscount']
                                            .toStringAsFixed(2) +
                                        ' USD'
                                    : 'Total  ' +
                                        provider.orders[widget.orderIndex]
                                                ['total']
                                            .toStringAsFixed(2) +
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

  ContainerResponsive slider(OrdersHistoryProvider provider) {
    return ContainerResponsive(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsetsResponsive.only(top: 0, right: 0, left: 0),
          itemCount: provider.orders[widget.orderIndex]['products'].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => provider.changeOrderDetailsSliderIndex(index),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        provider.orders[widget.orderIndex]['products'][index]
                            ['img'],
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContainerResponsive(
                      width: 44,
                      height: 4,
                      color: provider.orderDetailsSliderIndex == index
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

  Padding productWidget(OrdersHistoryProvider provider) {
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
                provider.orders[widget.orderIndex]['products']
                    [provider.orderDetailsSliderIndex]['img'],
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
                        provider.orders[widget.orderIndex]['products']
                            [provider.orderDetailsSliderIndex]['name'],
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
                provider.orders[widget.orderIndex]['products']
                        [provider.orderDetailsSliderIndex]['desc'] ??
                    '',
                style: TextStyle(
                    color: Color(0xff8D8D8D),
                    fontSize: ScreenUtil().setSp(10),
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  provider.orders[widget.orderIndex]['products']
                              [provider.orderDetailsSliderIndex]['size'] !=
                          null
                      ? ContainerResponsive(
                          height: 33,
                          width: 33,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(360),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            provider.orders[widget.orderIndex]['size'],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(13),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      : ContainerResponsive(),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxResponsive(
                    width: 20,
                  ),
                  AutoSizeText(
                    '${provider.orders[widget.orderIndex]['products'][provider.orderDetailsSliderIndex]['quantity']}' +
                        ' X ' +
                        provider.orders[widget.orderIndex]['products']
                                [provider.orderDetailsSliderIndex]['discount']
                            .toString() +
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
                    '${provider.orders[widget.orderIndex]['products'][provider.orderDetailsSliderIndex]['quantity'] * double.parse(provider.orders[widget.orderIndex]['products'][provider.orderDetailsSliderIndex]['discount'].toString())}' +
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
