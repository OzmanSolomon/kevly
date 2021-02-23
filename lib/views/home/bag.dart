import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/checkout/checkout.dart';
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

  final SlidableController slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
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
          title: 'SHOPPING BAG',
          isBackButton: false,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Consumer<BagProvider>(builder: (context, provider, child) {
                    return AutoSizeText(
                      '${provider.bagItems.length} items',
                      style: TextStyle(
                          color: Color(0xff8D8D8D),
                          fontSize: ScreenUtil().setSp(14),
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Provider.of<BagProvider>(context, listen: false)
                          .bagItems
                          .isNotEmpty
                      ? Expanded(
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
                                        return productCard(provider, index);
                                      });
                                }),
                                ContainerResponsive(
                                  alignment: Alignment.center,
                                  color: Color(0xffF7F8F8),
                                  width: 375,
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 25,
                                          ),
                                          AutoSizeText(
                                            'PROMO CODE'.toUpperCase(),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    ScreenUtil().setSp(15),
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
                                            ContainerResponsive(
                                              height: 40,
                                              width: 200,
                                              child: TextField(
                                                controller:
                                                    Provider.of<BagProvider>(
                                                            context,
                                                            listen: false)
                                                        .promoCodeController,
                                                decoration: new InputDecoration(
                                                    border:
                                                        new OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        const Radius.circular(
                                                            0.0),
                                                      ),
                                                    ),
                                                    suffixText: 'USD',
                                                    suffixStyle: TextStyle(
                                                        color: Colors.grey)),
                                              ),
                                            ),
                                            Consumer<BagProvider>(builder:
                                                (context, provider, child) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    provider.applyPromo(),
                                                child: ContainerResponsive(
                                                    width: 100,
                                                    height: 40,
                                                    color: Color(0xff292F33),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Redeem',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: ScreenUtil()
                                                              .setSp(15),
                                                          fontFamily: 'Oswald',
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBoxResponsive(
                                          height: 20,
                                        ),
                                        provider.promoCodeApplied
                                            ? AutoSizeText(
                                                provider.total
                                                        .toStringAsFixed(2) +
                                                    ' USD',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color:
                                                        appTheme().accentColor,
                                                    fontSize:
                                                        ScreenUtil().setSp(10),
                                                    fontFamily: 'Oswald',
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            : ContainerResponsive(),
                                        AutoSizeText(
                                          provider.promoCodeApplied
                                              ? 'Total  ' +
                                                  provider.totalDiscount
                                                      .toStringAsFixed(2) +
                                                  ' USD'
                                              : 'Total  ' +
                                                  provider.total
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
                                Center(
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(context,
                                        SlideTopRoute(page: Checkout())),
                                    child: ContainerResponsive(
                                      padding: EdgeInsetsResponsive.all(8),
                                      width: 325,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'BUY',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    ScreenUtil().setSp(17),
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
                        )
                      : Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBoxResponsive(
                                height: 150,
                              ),
                              SvgPicture.asset(
                                'assets/images/bagIcon.svg',
                                width: 150,
                                height: 150,
                                color: Colors.grey,
                              ),
                              SizedBoxResponsive(
                                height: 100,
                              ),
                              AutoSizeText(
                                'No Item In The Bag',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(22),
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                ]),
          ),
        ),
      ),
    );
  }

  dynamic productCard(BagProvider provider, int index) {
    try {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
          controller: slidableController,
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
              onTap: () => provider.deleteProduct(index),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ContainerResponsive(
                          width: 90,
                          child: AutoSizeText(
                            provider.bagItems[index]['name'],
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
                    provider.bagItems[index]['desc'] ?? '',
                    style: TextStyle(
                        color: Color(0xff8D8D8D),
                        fontSize: ScreenUtil().setSp(10),
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: [
                      provider.bagItems[index]['size'] != null
                          ? ContainerResponsive(
                              height: 33,
                              width: 33,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                provider.bagItems[index]['size'] ?? '',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(13),
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          : ContainerResponsive(),
                      GestureDetector(
                        onTap: () => provider.decreaseQuantity(index),
                        child: AutoSizeText(
                          '<',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(10),
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AutoSizeText(
                        '${provider.bagItems[index]['quantity']}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(12),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => provider.increaseQuantity(index),
                        child: AutoSizeText(
                          '>',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(10),
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
                      AutoSizeText(
                        '${provider.quantity}' +
                            ' X ' +
                            provider.bagItems[index]['discount'] +
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
                        '${provider.quantity * double.parse(provider.bagItems[index]['discount'])}' +
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
        ),
      );
    } catch (e) {
      return ContainerResponsive();
    }
  }
}
