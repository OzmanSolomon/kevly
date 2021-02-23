import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/collectionProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CustomCollectionView extends StatefulWidget {
  @override
  _CustomCollectionViewState createState() => _CustomCollectionViewState();
}

class _CustomCollectionViewState extends State<CustomCollectionView> {
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
        key:
            Provider.of<CollectionProvider>(context, listen: false).scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsetsResponsive.only(
                          left: 20.0, right: 20, top: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/images/cross.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 33.0),
                    child: Row(
                      children: [
                        SizedBoxResponsive(
                          width: 73,
                        ),
                        AutoSizeText(
                          'Collection',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(28),
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<CollectionProvider>(
                        builder: (context, provider, child) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsetsResponsive.only(
                              top: 20, right: 0, left: 0),
                          itemCount: provider.items.length + 2,
                          itemBuilder: (context, index) {
                            return ContainerResponsive(
                                width: 50,
                                child: index == 7 ||
                                        index == provider.items.length + 1
                                    ? Divider(
                                        thickness: 2,
                                        height: 25,
                                        indent: 72,
                                        endIndent: 87,
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          provider.navigationPage(
                                              context,
                                              index >= 7
                                                  ? provider.items[index - 1]
                                                  : index ==
                                                          provider.items
                                                                  .length +
                                                              1
                                                      ? provider
                                                          .items[index - 2]
                                                      : provider.items[index]);
                                        },
                                        child: ContainerResponsive(
                                          margin: EdgeInsetsResponsive.only(
                                              top: 20, left: 72.0, right: 18),
                                          child: AutoSizeText(
                                            index >= 7
                                                ? provider.items[index - 1]
                                                : index ==
                                                        provider.items.length +
                                                            1
                                                    ? provider.items[index - 2]
                                                    : provider.items[index],
                                            style: TextStyle(
                                                color: Color(0xff666E74),
                                                fontSize:
                                                    ScreenUtil().setSp(20),
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ));
                          });
                    }),
                  ),
                ]),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/splashTopCorner.png',
                    height: 280.61.h,
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
