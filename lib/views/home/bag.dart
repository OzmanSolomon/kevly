import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/order/checkout.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Bag extends StatefulWidget {
  @override
  _BagState createState() => _BagState();
}

class _BagState extends State<Bag> {
  @override
  void initState() {
    super.initState();
  }

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
          showClearBtn: true,
          productList:
              Provider.of<BagProvider>(context, listen: false).bagItems,
          title: 'SHOPPING BAG',
          isBackButton: false,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              child: Column(children: <Widget>[
                TextResponsive(
                  '3 items',
                  style: TextStyle(
                      color: Color(0xff8D8D8D),
                      fontSize: 14,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Consumer<BagProvider>(
                            builder: (context, provider, child) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsetsResponsive.only(
                                  top: 20, right: 0, left: 0),
                              itemCount: provider.bagItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Slidable(
                                    actionPane: SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    secondaryActions: <Widget>[
                                      IconSlideAction(
                                        caption: '',
                                        color: Color(0xffC30404),
                                        iconWidget: SvgPicture.asset(
                                          'assets/images/trash.svg',
                                          width: 23.44,
                                          height: 29.65,
                                        ),
                                        onTap: () => provider.deleteProduct(),
                                      ),
                                    ],
                                    child: Row(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            borderRadius: new BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            child: Image.asset(
                                              provider.bagItems[index]['img'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBoxResponsive(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 90,
                                                    child: TextResponsive(
                                                      provider.bagItems[index]
                                                          ['name'],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily: 'Oswald',
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBoxResponsive(
                                              height: 5,
                                            ),
                                            TextResponsive(
                                              provider.bagItems[index]['desc'],
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              360),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 1)),
                                                  alignment: Alignment.center,
                                                  child: TextResponsive(
                                                    provider.bagItems[index]
                                                        ['size'],
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () => provider
                                                      .decreaseQuantity(index),
                                                  child: TextResponsive(
                                                    '<',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                TextResponsive(
                                                  '${provider.bagItems[index]['quantity']}',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                  onTap: () => provider
                                                      .increaseQuantity(index),
                                                  child: TextResponsive(
                                                    '>',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBoxResponsive(
                                                  width: 20,
                                                ),
                                                TextResponsive(
                                                  '${provider.quantity}' +
                                                      ' X ' +
                                                      provider.bagItems[index]
                                                          ['discount'] +
                                                      ' USD',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBoxResponsive(
                                                  width: 5,
                                                ),
                                                TextResponsive(
                                                  '${provider.quantity * double.parse(provider.bagItems[index]['discount'])}' +
                                                      ' USD',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w500),
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
                                  ),
                                );
                              });
                        }),
                        ContainerResponsive(
                          alignment: Alignment.center,
                          color: Color(0xffF7F8F8),
                          width: 375,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  TextResponsive(
                                    'PROMO CODE'.toUpperCase(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsetsResponsive.only(
                                    left: 25, right: 25),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: width - 180,
                                      child: TextField(
                                        decoration: new InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(0.0),
                                              ),
                                            ),
                                            suffixText: 'USD',
                                            suffixStyle: const TextStyle(
                                                color: Colors.grey)),
                                      ),
                                    ),
                                    Consumer<BagProvider>(
                                        builder: (context, provider, child) {
                                      return GestureDetector(
                                        onTap: () => provider.applyPromo(),
                                        child: Container(
                                            width: 100,
                                            height: 40,
                                            color: Color(0xff292F33),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Redeem',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBoxResponsive(
                          height: 20,
                        ),
                        Center(
                          child: Consumer<BagProvider>(
                              builder: (context, provider, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBoxResponsive(
                                  height: 20,
                                ),
                                provider.promoCodeApplied
                                    ? TextResponsive(
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
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextResponsive(
                                    'BUY',
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
      ),
    );
  }
}
