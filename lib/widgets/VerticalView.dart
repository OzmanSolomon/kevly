import 'package:flutter/material.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

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
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Image.asset(
                            list[index]['img'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )),
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
          );
        });
  }
}
