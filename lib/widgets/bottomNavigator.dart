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
    return Scaffold(
        backgroundColor: Colors.white,
        key: mainScaffoldKey,
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
          child:
              Consumer<BottomNavProvider>(builder: (context, provider, child) {
            return BottomNavigationBar(
              elevation: 0,
              currentIndex: bottomNavigationIndex,
              selectedLabelStyle: TextStyle(
                  color: appTheme().accentColor,
                  fontSize: 9,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w400),
              selectedItemColor: appTheme().accentColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/homeIcon.svg'),
                    activeIcon: SvgPicture.asset(
                      'assets/images/homeIcon.svg',
                      color: appTheme().accentColor,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/eliteIcon.svg'),
                    activeIcon: SvgPicture.asset(
                      'assets/images/eliteIcon.svg',
                      color: appTheme().accentColor,
                    ),
                    label: 'ELITE'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/saleIcon.svg'),
                    activeIcon: SvgPicture.asset(
                      'assets/images/saleIcon.svg',
                      color: appTheme().accentColor,
                    ),
                    label: 'SALE'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/wishlistIcon.svg'),
                    activeIcon: SvgPicture.asset(
                      'assets/images/wishlistIcon.svg',
                      color: appTheme().accentColor,
                    ),
                    label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/bagIcon.svg'),
                    activeIcon: SvgPicture.asset(
                      'assets/images/bagIcon.svg',
                      color: appTheme().accentColor,
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
        ));
  }
}
