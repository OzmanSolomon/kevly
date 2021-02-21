import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/views/filter/filterView.dart';

import 'package:responsive_widgets/responsive_widgets.dart';

import 'drawer.dart';
import 'navigations.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    @required this.title,
    this.hideFilter,
    this.showClearBtn,
    this.onClear,
    @required this.isBackButton,
    this.productList,
  });
  final String title;
  final onClear;
  final bool showClearBtn;
  final bool hideFilter;
  final bool isBackButton;
  final List productList;

  @override
  Size get preferredSize => Size.fromHeight(44.h);
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
                isBackButton
                    ? GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40.5.h,
                          width: 40.14.w,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Center(
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => Navigator.push(
                            context, SlideRightRoute(page: CustomDrawer())),
                        child: Container(
                          height: 40.5.h,
                          width: 40.14.w,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/homeMenu.svg',
                                height: 15.5.h,
                                width: 22.14.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                TextResponsive(
                  title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w300),
                ),
                showClearBtn == true
                    ? GestureDetector(
                        onTap: () => onClear(),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: TextResponsive(
                            'CLEAR',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      )
                    : hideFilter == true
                        ? Container()
                        : GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                SlideTopRoute(
                                    page: FilterView(
                                  productList: productList,
                                ))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
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
                          ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
