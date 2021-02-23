import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/core/providers/bookAppointmentProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    var bookAppointmentProvider =
        Provider.of<BookAppointmentProvider>(context, listen: false);

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
          title: 'Book appointment',
          isBackButton: true,
          isCrossIcon: true,
          hideFilter: true,
        ),
        body: Form(
          key: bookAppointmentProvider.formKey,
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
                        title: 'Full Name *',
                        keyboard: TextInputType.text,
                        controller: bookAppointmentProvider.nameController,
                        validator: Validator.validateName,
                        focusNode: bookAppointmentProvider.nameFocus),
                    customTextField(
                        title: 'Email *',
                        keyboard: TextInputType.emailAddress,
                        controller: bookAppointmentProvider.emailController,
                        validator: Validator.validateEmail,
                        focusNode: bookAppointmentProvider.emailFocus),
                    customDateTextField(
                        title: 'Choose a date*',
                        giftProvider: bookAppointmentProvider),
                    customTimeTextField(
                        title: 'Arrival Time *',
                        giftProvider: bookAppointmentProvider),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (!isRelease ||
                              Provider.of<BookAppointmentProvider>(context,
                                      listen: false)
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
                                'Book Appointment'.toUpperCase(),
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

  Column customDateTextField({title, BookAppointmentProvider giftProvider}) {
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

  Column customTimeTextField({title, BookAppointmentProvider giftProvider}) {
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
              width: 160,
              margin: EdgeInsetsResponsive.only(right: 20, left: 10, top: 5),
              child: TextFormField(
                maxLength: 2,
                controller: giftProvider.hoursController,
                focusNode: giftProvider.hoursFocus,
                validator: Validator.validateEmpty,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: 'HH',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ),
            ContainerResponsive(
              width: 160,
              margin: EdgeInsetsResponsive.only(right: 0, left: 0, top: 5),
              child: TextFormField(
                maxLength: 2,
                controller: giftProvider.minutesController,
                focusNode: giftProvider.minutesFocus,
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
                              "assets/images/bkb.png",
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
                      'Visit us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w300),
                    ),
                    AutoSizeText(
                      '''IN OUR SHOWROOM''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(24),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w500),
                    ),
                    AutoSizeText(
                      '''Waiting for you!''',
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
