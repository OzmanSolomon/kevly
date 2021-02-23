import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'addPaymentMethod.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
          title: 'PAYMENT METHOD'.toUpperCase(),
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
                    Consumer<BagProvider>(builder: (context, provider, child) {
                      return provider.paymentMethods.isNotEmpty
                          ? ListView.builder(
                              itemCount: provider.paymentMethods.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                String cardPic;
                                switch (provider.paymentMethods[index]
                                    ['type']) {
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
                                return Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  controller: slidableController,
                                  secondaryActions: <Widget>[
                                    IconSlideAction(
                                      caption: '',
                                      color: Color(0xffC30404),
                                      iconWidget: SvgPicture.asset(
                                        'assets/images/trash.svg',
                                        width: 23.44,
                                        height: 29.65,
                                      ),
                                      onTap: () =>
                                          provider.deleteGateway(index),
                                    ),
                                  ],
                                  child: GestureDetector(
                                    onTap: () => provider.navigateToFinal(
                                        context, index),
                                    child: ContainerResponsive(
                                      height: 70,
                                      width: width - 20,
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                          .paymentMethods[index]
                                                              ['cardNumber']
                                                          .length >
                                                      8
                                                  ? provider
                                                      .paymentMethods[index]
                                                          ['cardNumber']
                                                      .replaceRange(0, 8,
                                                          '• • • • • • • • ')
                                                  : provider
                                                          .paymentMethods[index]
                                                      ['cardNumber'],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      ScreenUtil().setSp(17),
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          ContainerResponsive()
                                        ],
                                      ),
                                    ),
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
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context, SlideTopRoute(page: AddPaymentMethod())),
                    child: ContainerResponsive(
                      padding: EdgeInsetsResponsive.all(8),
                      margin: EdgeInsetsResponsive.only(bottom: 28),
                      width: 325,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'ADD NEW',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column customTextField({title, controller, focusNode, validator, keyboard}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            keyboardType: keyboard != null ? keyboard : TextInputType.text,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(0.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
