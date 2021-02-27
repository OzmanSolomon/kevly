import 'package:auto_size_text/auto_size_text.dart';
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
    this.backgroundColor,
    this.onClear,
    @required this.isBackButton,
    this.productList,
    this.isCrossIcon,
  });
  final String title;
  final onClear;
  final backgroundColor;
  final bool showClearBtn;
  final bool isCrossIcon;
  final bool hideFilter;
  final bool isBackButton;
  final List productList;

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setSp(52));
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
      child: Container(
        color: backgroundColor != null ? backgroundColor : Colors.white,
        child: Column(
          children: [
            SizedBoxResponsive(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isBackButton
                    ? GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: ContainerResponsive(
                          height: 40.5.h,
                          width: 25.14.w,
                          child: Padding(
                            padding: EdgeInsetsResponsive.only(
                                right: 8.0, left: 8.0),
                            child: Center(
                              child: isCrossIcon == true
                                  ? SvgPicture.asset(
                                      'assets/images/cross.svg',
                                      height: 15.5.h,
                                      width: 22.14.w,
                                    )
                                  : Icon(
                                      Icons.arrow_back,
                                      size: ScreenUtil().setSp(20),
                                    ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => Navigator.push(
                            context, SlideRightRoute(page: CustomDrawer())),
                        child: ContainerResponsive(
                          height: 40.5.h,
                          width: 40.14.w,
                          child: Padding(
                            padding: EdgeInsetsResponsive.only(
                                right: 8.0, left: 8.0),
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
                AutoSizeText(
                  title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(17),
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w400),
                ),
                showClearBtn == true
                    ? GestureDetector(
                        onTap: () => onClear(),
                        child: Padding(
                          padding:
                              EdgeInsetsResponsive.only(right: 8.0, left: 8.0),
                          child: AutoSizeText(
                            'CLEAR',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(10),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => hideFilter == true
                            ? print('')
                            : Navigator.push(
                                context,
                                SlideTopRoute(
                                    page: FilterView(
                                  productList: productList,
                                ))),
                        child: Padding(
                          padding: EdgeInsetsResponsive.only(
                              right: 28.0, left: 28.0),
                          child: Center(
                            child: AutoSizeText(
                              hideFilter == true ? '     ' : 'Filter',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(12),
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
