import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/core/providers/ordersHistoryProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'orderDetail.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BagProvider>(context, listen: false).setRegions();
    });
  }

  @override
  void dispose() {
    super.dispose();
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
    var width = MediaQuery.of(context).size.width;
    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'PREVIOUS ORDERS'.toUpperCase(),
          hideFilter: true,
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: <Widget>[
                    Consumer<OrdersHistoryProvider>(
                        builder: (context, provider, child) {
                      return provider.orders.isNotEmpty
                          ? ListView.builder(
                              itemCount: provider.orders.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        SlideTopRoute(
                                            page: OrderDetails(
                                                orderIndex: index)));
                                  },
                                  child: Row(
                                    children: [
                                      SizedBoxResponsive(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ContainerResponsive(
                                            width: width - 90,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  provider.orders[index]
                                                      ['data'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xffF05F96),
                                                      fontSize: ScreenUtil()
                                                          .setSp(14),
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                AutoSizeText(
                                                  'View Receipt',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(12),
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ContainerResponsive(
                                              height: 110,
                                              width: width - 80,
                                              alignment: Alignment.center,
                                              child: ClipRRect(
                                                borderRadius:
                                                    new BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                child: Card(
                                                  elevation: 5,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: provider
                                                        .orders[index]
                                                            ['products']
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index2) {
                                                      return Container(
                                                        margin:
                                                            EdgeInsets.all(8),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .all(
                                                            Radius.circular(15),
                                                          ),
                                                          child: Image.asset(
                                                              provider.orders[
                                                                          index]
                                                                      [
                                                                      'products']
                                                                  [
                                                                  index2]['img']),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBoxResponsive(
                                    height: 200,
                                  ),
                                  AutoSizeText(
                                    'You Haven\'t Payment \n Method Yet',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(22),
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBoxResponsive(
                                    height: 100,
                                  ),
                                ],
                              ),
                            );
                    }),
                    SizedBoxResponsive(
                      height: 81,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
