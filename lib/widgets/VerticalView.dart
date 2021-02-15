import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/product/productDetails.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'navigations.dart';

class VerticalView extends StatelessWidget {
  final List list;
  VerticalView({this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsetsResponsive.all(0.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 160 / 290,
        ),
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
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
                              child: Container(
                                width: 90,
                                child: TextResponsive(
                                  list[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
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
                            TextResponsive(
                              list[index]['discount'] + ' USD',
                              style: TextStyle(
                                  color: Color(0xffCECECE),
                                  fontSize: 10,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBoxResponsive(
                              width: 5,
                            ),
                            TextResponsive(
                              '\$' + list[index]['price'] + ' USD',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: appTheme().accentColor,
                                  fontSize: 10,
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
                    child: Container(
                      padding: EdgeInsetsResponsive.all(8),
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/wishlistIcon.svg',
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
