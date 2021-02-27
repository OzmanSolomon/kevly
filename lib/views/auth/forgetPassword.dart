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
import 'package:kyveli/core/providers/forgetPasswordProvider.dart';
import 'package:kyveli/widgets/customButton.dart';
import 'package:kyveli/widgets/customTextField.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    super.initState();
  }

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
        key: Provider.of<ForgetPasswordProvider>(context, listen: false)
            .scaffoldKey,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              height: height,
              child: Form(
                key: Provider.of<ForgetPasswordProvider>(context, listen: false)
                    .formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBoxResponsive(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<ForgetPasswordProvider>(context,
                                      listen: false)
                                  .back(context);
                            },
                            child: ContainerResponsive(
                                width: 25,
                                height: 25,
                                child: SvgPicture.asset(
                                  'assets/images/cross.svg',
                                  width: 25.w,
                                  height: 25.h,
                                )),
                          ),
                        ),
                        SizedBoxResponsive(
                          height: 70,
                        ),
                        Row(
                          children: [
                            SizedBoxResponsive(width: 26),
                            Consumer<ForgetPasswordProvider>(
                                builder: (context, provider, child) {
                              return AutoSizeText(
                                '${provider.title}'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(45),
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w500),
                              );
                            }),
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
                          child: Consumer<ForgetPasswordProvider>(
                              builder: (context, provider, child) {
                            return provider.state == 1
                                ? AutoSizeText(
                                    '${provider.subTitle}'.toUpperCase(),
                                    style: TextStyle(
                                        color: Color(0xff8B8B8B),
                                        fontSize: ScreenUtil().setSp(14),
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w400),
                                  )
                                : CustomTextField(
                                    controller: provider.passController,
                                    focusNode: provider.passFocus,
                                    hint: 'PASSWORD',
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: Validator.validatePasswordLength,
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
                          child: Consumer<ForgetPasswordProvider>(
                              builder: (context, provider, child) {
                            return provider.state == 1
                                ? CustomTextField(
                                    controller: provider.emailController,
                                    focusNode: provider.emailFocus,
                                    hint: 'EMAIL',
                                    textInputType: TextInputType.emailAddress,
                                    validator: Validator.validateEmail,
                                  )
                                : CustomTextField(
                                    controller: provider.confirmPassController,
                                    focusNode: provider.confirmPassFocus,
                                    hint: 'CONFIRM PASSWORD',
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: Validator.validatePasswordLength,
                                  );
                          }),
                        ),
                        SizedBoxResponsive(
                          height: 44,
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: ContainerResponsive(
                          width: 325,
                          height: 50,
                          child: Consumer<ForgetPasswordProvider>(
                              builder: (context, provider, child) {
                            return CustomRaisedButton(
                              fontColor: Color(0xffFFFFFF),
                              fontFamily: 'GeDinarOne_Medium',
                              fontSize: ScreenUtil().setSp(17),
                              onPressed: () {
                                if (!isRelease ||
                                    provider.formKey.currentState.validate()) {
                                  provider.send(context);
                                }
                              },
                              title: 'SEND',
                            );
                          })),
                    ),
                    SizedBoxResponsive(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
