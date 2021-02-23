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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsetsResponsive.only(
                            left: 20.0, right: 20, top: 20),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/images/cross.svg',
                            width: 25.w,
                          height: 25.h,
                          ),
                        ),
                      ),
                    ),
                    ContainerResponsive(
                      width: 400,
                      child: Consumer<DrawerProvider>(
                          builder: (context, provider, child) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsetsResponsive.only(
                                top: 20, right: 0, left: 0),
                            itemCount: provider.items.length + 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  provider.navigationPage(context, index);
                                },
                                child: ContainerResponsive(
                                  width: 50,
                                  child: index == 6 || index == 9
                                      ? Divider(
                                          thickness: 2,
                                          height: 25,
                                          indent: 72,
                                          endIndent: 87,
                                        )
                                      : index == 3
                                          ? ContainerResponsive(
                                              color:
                                                  Theme.of(context).accentColor,
                                              width: 150,
                                              margin: EdgeInsetsResponsive.only(
                                                  top: 20, left: 53, right: 72),
                                              padding:
                                                  EdgeInsetsResponsive.only(
                                                      top: 0,
                                                      left: 12,
                                                      right: 12),
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                provider.items[index],
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        ScreenUtil().setSp(28),
                                                    fontFamily: 'Oswald',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          : index != provider.items.length + 2
                                              ? ContainerResponsive(
                                                  margin:
                                                      EdgeInsetsResponsive.only(
                                                          top: 20,
                                                          left: index == 3
                                                              ? 0
                                                              : 72.0,
                                                          right: 18),
                                                  child: AutoSizeText(
                                                    index >= 6
                                                        ? provider
                                                            .items[index - 1]
                                                        : provider.items[index],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: ScreenUtil()
                                                            .setSp(28),
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : SocialMediaRow(),
                                ),
                              );
                            });
                      }),
                    ),
                  ]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/splashTopCorner.png',
                    height: 280.61.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    'assets/images/splashbottomcorner.png',
                    height: 280.61.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({
    Key key,
  }) : super(key: key);

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
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContainerResponsive(),
            GestureDetector(
              child: Container(
                width: ScreenUtil().setSp(46.37),
                height: ScreenUtil().setSp(46.37),
                padding: EdgeInsetsResponsive.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(360),
                ),
                child: SvgPicture.asset(
                  'assets/images/fb.svg',
                  width: ScreenUtil().setSp(36.37),
                  height: ScreenUtil().setSp(36.37),
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                width: ScreenUtil().setSp(46.37),
                height: ScreenUtil().setSp(46.37),
                padding: EdgeInsetsResponsive.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(360),
                    border: Border.all(
                        color: Theme.of(context).accentColor, width: 2)),
                child: SvgPicture.asset(
                  'assets/images/instgram.svg',
                  width: ScreenUtil().setSp(36.37),
                  height: ScreenUtil().setSp(36.37),
                  color: Colors.white,
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
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(360),
                    border: Border.all(
                        color: Theme.of(context).accentColor, width: 2)),
                child: SvgPicture.asset(
                  'assets/images/google.svg',
                  width: ScreenUtil().setSp(36.37),
                  height: ScreenUtil().setSp(36.37),
                  color: Colors.white,
                ),
              ),
            ),
            ContainerResponsive(),
          ],
        ),
      ),
    );
  }
}
