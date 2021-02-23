import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/core/providers/productDetails.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/product/productDetails.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'navigations.dart';

class VerticalView extends StatelessWidget {
  final List list;
  final bool showAddToBagButton;
  VerticalView({this.list, this.showAddToBagButton});

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsetsResponsive.all(0.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  showAddToBagButton == true ? 160.w / 360.h : 160.w / 280.h,
            ),
            itemCount: list.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return showAddToBagButton == true
                  ? withAddToBag(index, context)
                  : withoutAddToBag(index, context);
            })
        : Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBoxResponsive(
                  height: 150,
                ),
                Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 80,
                  color: Theme.of(context).accentColor,
                ),
                SizedBoxResponsive(
                  height: 100,
                ),
                AutoSizeText(
                  'No Product Found',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(22),
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
  }

  Padding withoutAddToBag(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsetsResponsive.only(top: index % 2 != 0 ? 15 : 0),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context, SlideTopRoute(page: ProductDetails())),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: new BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      list[index]['img'],
                      fit: BoxFit.cover,
                      width: 160.w,
                      height: 220.h,
                    ),
                  ),
                  SizedBoxResponsive(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ContainerResponsive(
                          width: 90,
                          child: AutoSizeText(
                            list[index]['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(14),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(
                        width: 20,
                      ),
                      AutoSizeText(
                        '\$' + list[index]['discount'] + ' USD',
                        style: TextStyle(
                            color: Color(0xffCECECE),
                            fontSize: ScreenUtil().setSp(10),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBoxResponsive(
                        width: 5,
                      ),
                      AutoSizeText(
                        '\$' + list[index]['price'] + ' USD',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: appTheme().accentColor,
                            fontSize: ScreenUtil().setSp(10),
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 26,
            top: 4,
            child: GestureDetector(
              onTap: () {},
              child: ContainerResponsive(
                padding: EdgeInsetsResponsive.all(8),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(360),
                ),
                child: SvgPicture.asset(
                  'assets/images/wishlistIcon.svg',
                  width: 18.w,
                  height: 18.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding withAddToBag(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsetsResponsive.only(top: index % 2 != 0 ? 15 : 0),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SlideTopRoute(page: ProductDetails()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        list[index]['img'],
                        fit: BoxFit.cover,
                        width: 160.w,
                        height: 220.h,
                      ),
                    ),
                  ),
                  SizedBoxResponsive(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ContainerResponsive(
                          width: 90,
                          child: AutoSizeText(
                            list[index]['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(14),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          AutoSizeText(
                            '\$' + list[index]['discount'] + ' USD',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(12),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBoxResponsive(
                            width: 5,
                          ),
                          AutoSizeText(
                            '\$' + list[index]['price'] + ' USD',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: appTheme().accentColor,
                                fontSize: ScreenUtil().setSp(10),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(
                        width: 20,
                      ),
                      Consumer<ProductDetialsProvider>(
                          builder: (context, provider, child) {
                        return GestureDetector(
                          onTap: () {
                            Provider.of<BagProvider>(context, listen: false)
                                .addToBag(
                                    img: list[index]['img'],
                                    name: list[index]['name'],
                                    size: list[index]['value'],
                                    price: list[index]['price'],
                                    discount: list[index]['discount'],
                                    desc: list[index]['disc']);
                          },
                          child: ContainerResponsive(
                            padding: EdgeInsetsResponsive.all(8),
                            width: 120,
                            height: 44,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'ADD TO CART',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(10),
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 26,
            top: 4,
            child: GestureDetector(
              onTap: () {},
              child: ContainerResponsive(
                padding: EdgeInsetsResponsive.all(8),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(360),
                ),
                child: SvgPicture.asset(
                  'assets/images/wishlistIcon.svg',
                  width: 18.w,
                  height: 18.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
