import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/core/providers/bottomNavProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/home/bag.dart';
import 'package:kyveli/views/home/elite.dart';
import 'package:kyveli/views/home/home.dart';
import 'package:kyveli/views/home/sales.dart';
import 'package:kyveli/views/home/wishlist.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildPageView() {
    return Consumer<BottomNavProvider>(builder: (context, provider, child) {
      return PageView(
        controller: provider.pageController,
        physics: ScrollPhysics(
          parent: NeverScrollableScrollPhysics(),
        ),
        onPageChanged: (index) {
          provider.pageChanged(index);
        },
        children: <Widget>[
          Home(),
          Elite(),
          Sales(),
          Wishlist(),
          Bag(),
        ],
      );
    });
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
          backgroundColor: Colors.white,
          body: buildPageView(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
              ],
            ),
            child: Consumer<BottomNavProvider>(
                builder: (context, provider, child) {
              return BottomNavigationBar(
                elevation: 0,
                currentIndex: bottomNavigationIndex,
                selectedLabelStyle: TextStyle(
                    color: appTheme().accentColor,
                    fontSize: ScreenUtil().setSp(9),
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w400),
                unselectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(9),
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w400),
                selectedItemColor: appTheme().accentColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/homeIcon.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/images/homeIcon.svg',
                        height: 20.h,
                        width: 20.w,
                        color: appTheme().accentColor,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/eliteIcon.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/images/eliteIcon.svg',
                        color: appTheme().accentColor,
                        height: 20.h,
                        width: 20.w,
                      ),
                      label: 'ELITE'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/saleIcon.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/images/saleIcon.svg',
                        color: appTheme().accentColor,
                        height: 20.h,
                        width: 20.w,
                      ),
                      label: 'SALE'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/wishlistIcon.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/images/wishlistIcon.svg',
                        color: appTheme().accentColor,
                        height: 20.h,
                        width: 20.w,
                      ),
                      label: 'Wishlist'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/bagIcon.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/images/bagIcon.svg',
                        color: appTheme().accentColor,
                        height: 20.h,
                        width: 20.w,
                      ),
                      label: 'BAG'),
                ],
                unselectedItemColor: Colors.black,
                onTap: (index) {
                  provider.bottomTapped(index);
                },
                backgroundColor: Colors.white,
              );
            }),
          )),
    );
  }
}
