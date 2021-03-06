/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Wrote By Osman Suliman in 2021 
 */
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/core/providers/loginProvider.dart';
import 'package:kyveli/views/auth/signup.dart';
import 'package:kyveli/widgets/customButton.dart';
import 'package:kyveli/widgets/customTextField.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'forgetPassword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  void nav(context) async {
    Provider.of<LoginProvider>(context, listen: false).navigationPage(context);
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
        key: Provider.of<LoginProvider>(context, listen: false).scaffoldKey,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: Provider.of<LoginProvider>(context, listen: false).formKey,
              child: Column(
                children: <Widget>[
                  SizedBoxResponsive(
                    height: 124,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(width: 26),
                      AutoSizeText(
                        'LET’S GET\nSTARTED',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(45),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 44,
                  ),
                  ContainerResponsive(
                    height: 39.5,
                    margin: EdgeInsetsResponsive.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Consumer<LoginProvider>(
                        builder: (context, provider, child) {
                      return CustomTextField(
                        controller: provider.emailController,
                        focusNode: provider.emailFocus,
                        hint: 'EMAIL',
                        textInputType: TextInputType.emailAddress,
                        validator: Validator.validateEmail,
                      );
                    }),
                  ),
                  SizedBoxResponsive(
                    height: 33,
                  ),
                  ContainerResponsive(
                    height: 39.5,
                    margin: EdgeInsetsResponsive.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Consumer<LoginProvider>(
                        builder: (context, provider, child) {
                      return CustomTextField(
                        controller: provider.passController,
                        focusNode: provider.passFocus,
                        hint: 'PASSWORD',
                        textInputType: TextInputType.visiblePassword,
                        validator: Validator.validatePasswordLength,
                      );
                    }),
                  ),
                  SizedBoxResponsive(
                    height: 44,
                  ),
                  GestureDetector(
                    child: ContainerResponsive(
                        width: 325,
                        height: 50,
                        child: Consumer<LoginProvider>(
                            builder: (context, provider, child) {
                          return CustomRaisedButton(
                            fontColor: Color(0xffFFFFFF),
                            fontFamily: 'GeDinarOne_Medium',
                            fontSize: ScreenUtil().setSp(17),
                            onPressed: () {
                              if (!isRelease ||
                                  provider.formKey.currentState.validate()) {
                                nav(context);
                              }
                            },
                            title: 'SIGN IN',
                          );
                        })),
                  ),
                  SizedBoxResponsive(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return ForgetPassword();
                            }),
                      );
                    },
                    child: AutoSizeText(
                      "Have you forgotten your password ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(12),
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBoxResponsive(
                    height: 38.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerResponsive(
                        height: 1,
                        width: 140,
                        color: Colors.black,
                      ),
                      SizedBoxResponsive(
                        width: 18.5,
                      ),
                      AutoSizeText(
                        "Or",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(10),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBoxResponsive(
                        width: 18.5,
                      ),
                      ContainerResponsive(
                        height: 1,
                        width: 140,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 23.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerResponsive(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: ScreenUtil().setSp(46.37),
                          height: ScreenUtil().setSp(46.37),
                          padding: EdgeInsetsResponsive.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: SvgPicture.asset(
                            'assets/images/fb.svg',
                            width: ScreenUtil().setSp(36.37),
                            height: ScreenUtil().setSp(36.37),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: ScreenUtil().setSp(46.37),
                          height: ScreenUtil().setSp(46.37),
                          padding: EdgeInsetsResponsive.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: SvgPicture.asset(
                            'assets/images/instgram.svg',
                            width: ScreenUtil().setSp(36.37),
                            height: ScreenUtil().setSp(36.37),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: ScreenUtil().setSp(46.37),
                          height: ScreenUtil().setSp(46.37),
                          padding: EdgeInsetsResponsive.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: SvgPicture.asset(
                            'assets/images/google.svg',
                            width: ScreenUtil().setSp(36.37),
                            height: ScreenUtil().setSp(36.37),
                          ),
                        ),
                      ),
                      ContainerResponsive(),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 90.6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return Signup();
                            }),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "New Member ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(14),
                            fontFamily: 'Oswald',
                          ),
                        ),
                        AutoSizeText(
                          "SIGN UP",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(14),
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBoxResponsive(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
