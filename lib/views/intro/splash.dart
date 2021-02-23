import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/splashProvider.dart';
import 'package:kyveli/widgets/loading.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      nav(context);
    });
  }

  void nav(context) async {
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
        key: Provider.of<SplashProvider>(context, listen: false).scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: ContainerResponsive(
                child: Image.asset(
                  'assets/images/splashTopCorner.png',
                  height: 280.61.h,
                ),
              ),
            ),
            Center(child: LoaderFetchingData()),
            Align(
              alignment: Alignment.bottomLeft,
              child: ContainerResponsive(
                child: Image.asset(
                  'assets/images/splashbottomcorner.png',
                  height: 280.61.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
