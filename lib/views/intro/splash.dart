import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/splashProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _nav(context);
    });
  }

  void _nav(context) async {
    Provider.of<SplashProvider>(context, listen: false).navigationPage(context);
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(),
            Center(
              child: TextResponsive(
                '',
                style: TextStyle(
                    color: appTheme().primaryColor,
                    fontSize: 32,
                    fontFamily: 'GeDinarOne_Medium'),
              ),
            ),
            Padding(
              padding: EdgeInsetsResponsive.only(bottom: 38.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    TextResponsive(
                      'Powered by',
                      style: TextStyle(
                          color: Color(0xffA3A3A3),
                          fontSize: 13,
                          fontFamily: 'Optima_Medium'),
                    ),
                    TextResponsive(
                      '',
                      style: TextStyle(
                          color: Color(0xff464646),
                          fontSize: 14,
                          fontFamily: 'GeDinarOne_Medium'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
