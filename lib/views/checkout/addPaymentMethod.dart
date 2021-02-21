import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class AddPaymentMethod extends StatefulWidget {
  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
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
    var height = MediaQuery.of(context).size.height;
    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppbar(
          title: 'PAYMENT METHOD'.toUpperCase(),
          hideFilter: true,
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Container(
                height: height - 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: <Widget>[
                      Consumer<BagProvider>(
                          builder: (context, provider, child) {
                        return Column(
                          children: [
                            Visibility(
                              visible: false,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 0, 18, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value:
                                              provider.gateWayType == 'credit',
                                          onChanged: (bool value) => provider
                                              .onSelectGateWay('credit'),
                                          checkColor: Colors.white,
                                          activeColor: Colors.blue,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            'assets/images/master.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            'assets/images/amex.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            'assets/images/visa.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: Colors.blue,
                                          value:
                                              provider.gateWayType == 'paypal',
                                          onChanged: (bool value) => provider
                                              .onSelectGateWay('paypal'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset(
                                            'assets/images/paypal.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      Consumer<BagProvider>(
                          builder: (context, provider, child) {
                        return CreditCardWidget(
                          cardNumber: provider.cardNumber,
                          expiryDate: provider.expiryDate,
                          cardHolderName: provider.cardHolderName,
                          cvvCode: provider.cvvCode,
                          showBackView: provider
                              .isCvvFocused, //true when you want to show cvv(back) view
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                        );
                      }),
                      Consumer<BagProvider>(
                          builder: (context, provider, child) {
                        return CreditCardForm(
                          formKey: provider.creditFormKey, // Required
                          onCreditCardModelChange: (CreditCardModel data) =>
                              provider
                                  .onCreditCardModelChange(data), // Required
                          themeColor: Colors.red,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumberDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                          ),
                        );
                      }),
                    ]),
                    Consumer<BagProvider>(builder: (context, provider, child) {
                      return Center(
                        child: GestureDetector(
                          onTap: () => provider.saveCard(context),
                          child: ContainerResponsive(
                            padding: EdgeInsetsResponsive.all(8),
                            margin: EdgeInsetsResponsive.only(bottom: 18),
                            width: 325,
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextResponsive(
                                      'Save card'.toUpperCase(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
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
