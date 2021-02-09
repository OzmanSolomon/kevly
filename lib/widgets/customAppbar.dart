import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({@required this.title});
  final String title;
  @override
  Size get preferredSize => Size.fromHeight(30.h);
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
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/homeMenu.svg',
                      height: 15.5.h,
                      width: 22.14.w,
                    ),
                  ),
                ),
                TextResponsive(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Center(
                    child: TextResponsive(
                      'Filter',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
