import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/core/providers/giftCard.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class GiftCard extends StatefulWidget {
  @override
  _GiftCardState createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    var giftProvider = Provider.of<GiftProvider>(context, listen: false);

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
          title: 'Gift Card',
          isBackButton: true,
          isCrossIcon: true,
          hideFilter: true,
        ),
        body: Form(
          key: giftProvider.formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBoxResponsive(
                      height: 30,
                    ),
                    Center(
                      child: topCard(),
                    ),
                    customTextField(
                        title: 'AMOUNT*',
                        keyboard: TextInputType.number,
                        controller: giftProvider.amountController,
                        validator: Validator.validateNormalText,
                        focusNode: giftProvider.amountFocus),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        AutoSizeText(
                          'Gift card is for',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: ScreenUtil().setSp(16),
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    customTextField(
                        title: 'Full Name *',
                        keyboard: TextInputType.text,
                        controller: giftProvider.nameController,
                        validator: Validator.validateName,
                        focusNode: giftProvider.nameFocus),
                    customTextField(
                        title: 'Email *',
                        keyboard: TextInputType.emailAddress,
                        controller: giftProvider.emailController,
                        validator: Validator.validateEmail,
                        focusNode: giftProvider.emailFocus),
                    customDateTextField(
                        title: 'Choose a date*', giftProvider: giftProvider),
                    customWordsTextField(
                        title: 'Some Sweet Words',
                        keyboard: TextInputType.text,
                        controller: giftProvider.wordsController,
                        focusNode: giftProvider.wordsFocus),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (!isRelease ||
                              Provider.of<GiftProvider>(context, listen: false)
                                  .formKey
                                  .currentState
                                  .validate()) {
                            print('');
                          }
                        },
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
                                'Add to shopping bag'.toUpperCase(),
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
                      height: 20,
                    ),
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
          padding: EdgeInsetsResponsive.only(right: 20, left: 20, top: 20),
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
          padding: EdgeInsetsResponsive.only(right: 20, left: 20, top: 5),
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
        ),
      ],
    );
  }

  Column customWordsTextField(
      {title, controller, focusNode, validator, keyboard}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsResponsive.only(right: 20, left: 20, top: 20),
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
          padding: EdgeInsetsResponsive.only(right: 20, left: 20, top: 5),
          child: TextFormField(
            maxLines: 5,
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
        ),
      ],
    );
  }

  Column customDateTextField({title, GiftProvider giftProvider}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsResponsive.only(right: 20, left: 20, top: 20),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w300),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerResponsive(
              width: 100,
              margin: EdgeInsetsResponsive.only(right: 20, left: 10, top: 5),
              child: TextFormField(
                maxLength: 2,
                controller: giftProvider.dayController,
                focusNode: giftProvider.dayFocus,
                validator: Validator.validateEmpty,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: 'DD',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ),
            ContainerResponsive(
              width: 100,
              margin: EdgeInsetsResponsive.only(right: 0, left: 0, top: 5),
              child: TextFormField(
                maxLength: 2,
                controller: giftProvider.monthController,
                focusNode: giftProvider.monthFocus,
                validator: Validator.validateEmpty,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: 'MM',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ),
            ContainerResponsive(
              width: 100,
              margin: EdgeInsetsResponsive.only(right: 10, left: 10, top: 5),
              child: TextFormField(
                maxLength: 2,
                controller: giftProvider.yearController,
                focusNode: giftProvider.yearFocus,
                validator: Validator.validateEmpty,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: 'YY',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  IgnorePointer topCard() {
    return IgnorePointer(
      child: ContainerResponsive(
        width: 335,
        height: 180,
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: 0.3,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: ContainerResponsive(
                          width: 335,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              "assets/images/giftCard.png",
                            ),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black, BlendMode.saturation),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Offer a',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w300),
                    ),
                    AutoSizeText(
                      '''KYVELI GIFT CARD''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(24),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w500),
                    ),
                    AutoSizeText(
                      '''in just few clicks away!''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
