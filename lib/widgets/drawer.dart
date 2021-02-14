import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/drawerProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
        key: Provider.of<DrawerProvider>(context, listen: false).scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key:
                    Provider.of<DrawerProvider>(context, listen: false).formKey,
                child: Stack(
                  children: [
                    Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 20),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/images/cross.svg',
                            width: 18,
                            height: 18,
                          ),
                        ),
                      )
                    ]),
                    Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/splashTopCorner.png',
                        height: 180.61.h,
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      height: 180.61,
                      width: 180,
                      child: Image.asset(
                        'assets/images/splashbottomcorner.png',
                        height: 180.61.h,
                        width: 180,
                      ),
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
