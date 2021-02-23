import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/views/checkout/paymentMethod.dart';

import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:kyveli/widgets/toasts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Delivrey extends StatefulWidget {
  @override
  _DelivreyState createState() => _DelivreyState();
}

class _DelivreyState extends State<Delivrey> {
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
          title: 'Delivery'.toUpperCase(),
          hideFilter: true,
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Consumer<BagProvider>(builder: (context, provider, child) {
                  List methodsList = provider.deliveryMethods;
                  return ListView.builder(
                      itemCount: methodsList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelected = provider.deliveryMethods != null
                            ? provider.deliveryMethod ==
                                    provider.deliveryMethods[index]
                                ? true
                                : false
                            : false;
                        return GestureDetector(
                          onTap: () => provider.onSelectMethod(
                              method: methodsList[index]),
                          child: ContainerResponsive(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: isSelected ? Colors.black : Colors.white,
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
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: ScreenUtil().setSp(15),
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w300),
                                      ),
                                      AutoSizeText(
                                        '(' + methodsList[index]['time'] + ')',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
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
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: ScreenUtil().setSp(15),
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
                SizedBox(
                  height: 121,
                ),
                Divider(
                  thickness: 2,
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
                        AutoSizeText(
                          provider.promoCodeApplied
                              ? 'Total  ' +
                                  provider.total.toStringAsFixed(2) +
                                  ' USD'
                              : 'Total  ' +
                                  provider.totalDiscount.toStringAsFixed(2) +
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
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () =>
                        Provider.of<BagProvider>(context, listen: false)
                                    .deliveryMethod !=
                                null
                            ? Navigator.push(
                                context, SlideTopRoute(page: PaymentMethod()))
                            : errorToast('select method'),
                    child: ContainerResponsive(
                      padding: EdgeInsetsResponsive.all(8),
                      width: 325,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'NEXT',
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
                SizedBox(
                  height: 30,
                )
              ]),
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
