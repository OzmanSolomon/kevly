import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/core/providers/accountProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'account.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    var accountProvider = Provider.of<AccountProvider>(context, listen: false);

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
          title: 'EDIT PROFILE',
          isBackButton: true,
          isCrossIcon: true,
          hideFilter: true,
        ),
        body: Form(
          key: accountProvider.formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBoxResponsive(
                      height: 10,
                    ),
                    ContainerResponsive(
                      margin: EdgeInsetsResponsive.only(
                          top: 20, left: 18.0, right: 18),
                      child: AutoSizeText(
                        'PERSONAL INFORMATION',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(16),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBoxResponsive(
                      height: 20,
                    ),
                    AccountHeader(),
                    SizedBoxResponsive(
                      height: 42,
                    ),
                    customTextField(
                        title: 'First name *',
                        validator: Validator.validateName,
                        controller: accountProvider.firstNameController,
                        focusNode: accountProvider.firstNameFocus),
                    customTextField(
                        title: 'Last name *',
                        validator: Validator.validateName,
                        controller: accountProvider.lastNameController,
                        focusNode: accountProvider.lastNameFocus),
                    customTextField(
                        title: 'Email Address *',
                        validator: Validator.validateEmail,
                        controller: accountProvider.emailController,
                        focusNode: accountProvider.emailFocus),
                    customTextField(
                        title: 'Phone *',
                        validator: Validator.validateEmail,
                        controller: accountProvider.phoneController,
                        focusNode: accountProvider.phoneFocus),
                    SizedBoxResponsive(
                      height: 20,
                    ),
                    ContainerResponsive(
                      margin: EdgeInsetsResponsive.only(
                          top: 20, left: 18.0, right: 18),
                      child: AutoSizeText(
                        'Change password',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(16),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBoxResponsive(
                      height: 20,
                    ),
                    customTextField(
                        title: 'Old password *',
                        validator: Validator.validateEmail,
                        controller: accountProvider.oldPassController,
                        focusNode: accountProvider.oldPassFocus),
                    customTextField(
                        title: 'Create new password *',
                        validator: Validator.validateEmail,
                        controller: accountProvider.newPassController,
                        focusNode: accountProvider.newPassFocus),
                    customTextField(
                        title: 'Confirm new password *',
                        validator: Validator.validateEmail,
                        controller: accountProvider.confirmPassController,
                        focusNode: accountProvider.confirmPassFocus),
                    SizedBoxResponsive(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!isRelease ||
                                accountProvider.formKey.currentState
                                    .validate()) {
                              accountProvider.onSave(context);
                            }
                          },
                          child: ContainerResponsive(
                            padding: EdgeInsetsResponsive.all(8),
                            margin: EdgeInsetsResponsive.only(bottom: 28),
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
                                  'SAVE',
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
                    SizedBoxResponsive(
                      height: 30,
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
