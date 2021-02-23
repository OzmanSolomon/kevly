import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/core/providers/bottomNavProvider.dart';
import 'package:kyveli/widgets/bottomNavigator.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Recipt extends StatefulWidget {
  @override
  _ReciptState createState() => _ReciptState();
}

class _ReciptState extends State<Recipt> {
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

    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Provider.of<BottomNavProvider>(context, listen: false)
                      .bottomTapped(0);
                  Navigator.pushReplacement(
                      context, SlideBottomRoute(page: BottomNavBar()));
                },
                child: ContainerResponsive(
                  padding: EdgeInsetsResponsive.all(8),
                  margin: EdgeInsetsResponsive.only(bottom: 28),
                  width: 325,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Back to Homepage'.toUpperCase(),
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
            Padding(
              padding: EdgeInsets.all(25),
              child: GestureDetector(
                onTap: () {
                  Provider.of<BottomNavProvider>(context, listen: false)
                      .bottomTapped(0);
                  Navigator.pushReplacement(
                      context, SlideBottomRoute(page: BottomNavBar()));
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
            IgnorePointer(
              child: Align(
                alignment: Alignment.topRight,
                child: ContainerResponsive(
                  child: Image.asset(
                    'assets/images/splashTopCorner.png',
                    height: 280.61.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 172.h,
              left: 54.w,
              right: 54.w,
              child: IgnorePointer(
                child: ContainerResponsive(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 280.61.h,
                    width: 375,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 351.h,
              left: 54.w,
              right: 54.w,
              child: IgnorePointer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Thank you for',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w300),
                    ),
                    AutoSizeText(
                      '''SHOPPING AT
KYVELI STORES''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(24),
                          fontFamily: 'playfairDisplay',
                          fontWeight: FontWeight.w500),
                    ),
                    AutoSizeText(
                      '''Your order will be delivered
The soonest!''',
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
            ),
            IgnorePointer(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ContainerResponsive(
                  child: Image.asset(
                    'assets/images/splashbottomcorner.png',
                    height: 280.61.h,
                    fit: BoxFit.fill,
                    // width: 200.w,
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: Opacity(
                opacity: 0.1,
                child: ContainerResponsive(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/images/rb.png",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black, BlendMode.saturation),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
