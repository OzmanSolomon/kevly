import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/addressProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'addAddress.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  void initState() {
    super.initState();
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
          title: 'My addresses'.toUpperCase(),
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
                    Consumer<AddressProvider>(
                        builder: (context, provider, child) {
                      return provider.addresses.isNotEmpty
                          ? ListView.builder(
                              itemCount: provider.addresses.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
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
                                          provider.deleteAddress(index),
                                    ),
                                  ],
                                  child: GestureDetector(
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
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Center(
                                            child: AutoSizeText(
                                              provider.addresses[index],
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
                        context, SlideTopRoute(page: AddAddress())),
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
