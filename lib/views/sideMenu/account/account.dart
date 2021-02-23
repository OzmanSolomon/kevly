import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/accountProvider.dart';
import 'package:kyveli/views/sideMenu/account/myPaymentMethods.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'editAccout.dart';
import 'myAddress.dart';
import 'ordersHistory.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
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
          title: 'Account',
          isBackButton: true,
          isCrossIcon: true,
          hideFilter: true,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBoxResponsive(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(
                            PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) {
                                  return EditAccount();
                                }),
                          ),
                      child: AccountHeader()),
                  SizedBoxResponsive(
                    height: 25,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBoxResponsive(
                    height: 42,
                  ),
                  accountRow(
                      icon: 'paymentMethod.svg',
                      title: 'Payment method',
                      navaigateTo: MyPaymentMethods()),
                  accountRow(
                      icon: 'pin.svg',
                      title: 'My addresses',
                      navaigateTo: MyAddress()),
                  accountRow(
                      icon: 'four.svg',
                      title: 'Previous orders',
                      navaigateTo: OrderHistory())
                ]),
          ),
        ),
      ),
    );
  }

  Column accountRow({icon, title, navaigateTo}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) {
                    return navaigateTo;
                  }),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBoxResponsive(
                    width: 20,
                  ),
                  SvgPicture.asset('assets/images/$icon'),
                  SizedBoxResponsive(
                    width: 10,
                  ),
                  Text(
                    '$title',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_forward_ios),
                  SizedBoxResponsive(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBoxResponsive(
          height: 42,
        ),
      ],
    );
  }
}

class AccountHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
        builder: (context, accountProvider, child) {
      return Row(
        children: [
          SizedBoxResponsive(
            width: 25,
          ),
          Image.asset(accountProvider.userImage),
          Padding(
            padding: EdgeInsetsResponsive.only(right: 20, left: 20, top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accountProvider.userName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(16),
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Edit profile',
                  style: TextStyle(
                      color: Color(0xff8D8D8D),
                      fontSize: ScreenUtil().setSp(13),
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
