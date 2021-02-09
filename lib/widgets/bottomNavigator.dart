import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/home/bag.dart';
import 'package:kyveli/views/home/elite.dart';
import 'package:kyveli/views/home/home.dart';
import 'package:kyveli/views/home/sales.dart';
import 'package:kyveli/views/home/wishlist.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController(
    initialPage: bottomNavigationIndex,
    keepPage: false,
  );
  @override
  void initState() {
    super.initState();
    // Provider.of<PushNotificationsProvider>(context, listen: false)
    //     .setUp(context);
  }

  void pageChanged(int index) {
    setState(() {
      bottomNavigationIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomNavigationIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      physics: ScrollPhysics(
        parent: NeverScrollableScrollPhysics(),
      ),
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Home(),
        Elite(),
        Sales(),
        Wishlist(),
        Bag(),
      ],
    );
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
          child: BottomNavigationBar(
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
            // ini: bottomNavigationIndex,
            onTap: (index) {
              bottomTapped(index);
            },
            // height: 60,
            // color: Colors.grey,
            // curveSize: 0,
            // style: TabStyle.custom,
            // activeColor: appTheme().accentColor,
            backgroundColor: Colors.white,
          ),
        ));
  }
}
