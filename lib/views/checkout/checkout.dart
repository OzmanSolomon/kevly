import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'delivrey.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BagProvider>(context, listen: false).setRegions();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var checkoutProvider = Provider.of<BagProvider>(context, listen: false);
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
        key: Provider.of<BagProvider>(context, listen: false)
            .checkoutScaffoldKey,
        appBar: CustomAppbar(
          title: 'CHECKOUT',
          hideFilter: true,
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: Provider.of<BagProvider>(context).checkoutFormKey,
                child: Column(children: <Widget>[
                  customTextField(
                      title: 'First name *',
                      validator: Validator.validateName,
                      controller: checkoutProvider.firstNameController,
                      focusNode: checkoutProvider.firstNameFocus),
                  customTextField(
                      title: 'Last name *',
                      validator: Validator.validateName,
                      controller: checkoutProvider.lastNameController,
                      focusNode: checkoutProvider.lastNameFocus),
                  customTextField(
                      title: 'Email Address *',
                      keyboard: TextInputType.emailAddress,
                      controller: checkoutProvider.emailNameController,
                      validator: Validator.validateEmail,
                      focusNode: checkoutProvider.emailNameFocus),
                  customTextField(
                      title: 'Phone *',
                      keyboard: TextInputType.phone,
                      controller: checkoutProvider.phoneNameController,
                      validator: Validator.validatePhoneNumber,
                      focusNode: checkoutProvider.phoneNameFocus),
                  customTextField(
                      title: 'Address *',
                      controller: checkoutProvider.addressNameController,
                      validator: Validator.validateNormalText,
                      focusNode: checkoutProvider.addressNameFocus),
                  customTextField(
                      title: 'Postcode *',
                      controller: checkoutProvider.postcodeNameController,
                      validator: Validator.validateNormalText,
                      focusNode: checkoutProvider.postcodeNameFocus),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Country *',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  ContainerResponsive(
                    height: 60,
                    width: width,
                    margin: const EdgeInsets.all(8.0),
                    padding: EdgeInsets.only(left: 40, right: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45, width: 1)),
                    child: Consumer<BagProvider>(
                        builder: (context, provider, child) {
                      return DropdownButton<String>(
                        icon: ContainerResponsive(
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/dropDownArrow.svg',
                              height: 6.w,
                              width: 6.h,
                            ),
                          ),
                        ),
                        dropdownColor: Colors.grey[100],
                        isExpanded: true,
                        items: provider.regoins,
                        underline: ContainerResponsive(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                        hint: AutoSizeText(
                          provider.region,
                          style: TextStyle(
                              fontFamily: 'GE_SS_Two_light',
                              fontSize: (12),
                              color: Colors.black),
                        ),
                        onChanged: (v) {
                          provider.region = v;
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    height: 121,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // if (Provider.of<BagProvider>(context, listen: false)
                        //     .checkoutFormKey
                        //     .currentState
                        //     .validate()) {
                        Navigator.push(
                            context, SlideTopRoute(page: Delivrey()));
                        // }
                      },
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
                                  fontSize: 17,
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
                fontSize: 14,
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
