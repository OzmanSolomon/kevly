import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/HomeProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/widgets/VerticalView.dart';
import 'package:kyveli/widgets/drawer.dart';
import 'package:kyveli/widgets/navigations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).setRegions();
    });
  }

  void nav(context) async {
    Provider.of<HomeProvider>(context, listen: false).navigationPage(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ResponsiveWidgets.init(
      context,
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
    );
    Provider.of<HomeProvider>(context, listen: false).setSlider();
    Provider.of<HomeProvider>(context, listen: false).setWeekltySlider();
    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
      child: Scaffold(
        key: Provider.of<HomeProvider>(context, listen: false).scaffoldKey,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: Provider.of<HomeProvider>(context, listen: false).formKey,
              child: Column(
                children: <Widget>[
                  SizedBoxResponsive(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsetsResponsive.only(left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context, SlideRightRoute(page: CustomDrawer())),
                          child: Container(
                            height: 40.5.h,
                            width: 40.14.w,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/homeMenu.svg',
                                height: 15.5.h,
                                width: 22.14.w,
                              ),
                            ),
                          ),
                        ),
                        ContainerResponsive(
                          width: 69,
                          height: 22,
                          child: Consumer<HomeProvider>(
                              builder: (context, provider, child) {
                            return DropdownButton<String>(
                              icon: ContainerResponsive(
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/images/dropDownArrow.svg',
                                    height: 6.w,
                                    width: 6.h,
                                  ),
                                ),
                              ),
                              dropdownColor: Colors.grey[100],
                              isExpanded: true,
                              items: provider.regoins,
                              underline: ContainerResponsive(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                ),
                              ),
                              hint: AutoSizeText(
                                provider.region,
                                style: TextStyle(
                                    fontFamily: 'GE_SS_Two_light',
                                    fontSize: (12),
                                    color: Colors.black),
                              ),
                              onChanged: (v) {
                                provider.region = v;
                              },
                            );
                          }),
                        ),
                        Row(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                'assets/images/homeMessage.svg',
                                height: 16.h,
                                width: 16.w,
                              ),
                            ),
                            SizedBoxResponsive(
                              width: 20,
                            ),
                            Center(
                              child: SvgPicture.asset(
                                'assets/images/homeSearch.svg',
                                height: 16.h,
                                width: 16.w,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBoxResponsive(
                    height: 23,
                  ),
                  ContainerResponsive(
                    height: 90,
                    width: width,
                    child: Consumer<HomeProvider>(
                        builder: (context, provider, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding:
                            EdgeInsetsResponsive.only(right: 18.0, left: 18),
                        itemBuilder: (context, index) => Padding(
                          padding:
                              EdgeInsetsResponsive.only(right: 9.0, left: 9),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(360),
                                ),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child:
                                      Image.asset(provider.cates[index]['img']),
                                ),
                              ),
                              AutoSizeText(
                                provider.cates[index]['name'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        itemCount: provider.cates.length,
                      );
                    }),
                  ),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return CarouselSlider(
                      items: provider.imageSliders,
                      options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 335 / 232,
                          onPageChanged: (index, reason) {
                            setState(() {
                              provider.current = index;
                            });
                          }),
                    );
                  }),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: provider.sliderImagesList.map((url) {
                        int index = provider.sliderImagesList.indexOf(url);
                        return Container(
                          width: provider.current == index ? 15 : 5,
                          height: 5,
                          margin: EdgeInsetsResponsive.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                            color: Color.fromRGBO(0, 0, 0, 0.9),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                  SizedBoxResponsive(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBoxResponsive(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'ITEMS OF THE WEEK',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return CarouselSlider(
                      items: provider.imageWeeklySliders,
                      options: CarouselOptions(
                          viewportFraction: 0.6,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 280 / 165,
                          onPageChanged: (index, reason) {
                            provider.changeWeeklySlider(index);
                          }),
                    );
                  }),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBoxResponsive(
                                  width: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    provider.weeklySliderList[
                                        provider.currentWeekly]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  AutoSizeText(
                                    provider.currentWeekly < 9
                                        ? '0${provider.currentWeekly + 1}'
                                        : '${provider.currentWeekly + 1}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  AutoSizeText(
                                    provider.weeklySliderList.length < 9
                                        ? '/ 0${provider.weeklySliderList.length}'
                                        : '/ ${provider.weeklySliderList.length}',
                                    style: TextStyle(
                                        color: Color(0xffCECECE),
                                        fontSize: 10,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBoxResponsive(
                                    width: 75,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBoxResponsive(
                              width: 20,
                            ),
                            AutoSizeText(
                              provider.weeklySliderList[provider.currentWeekly]
                                      ['discount'] +
                                  ' USD',
                              style: TextStyle(
                                  color: Color(0xffCECECE),
                                  fontSize: 10,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBoxResponsive(
                              width: 5,
                            ),
                            AutoSizeText(
                              '\$' +
                                  provider.weeklySliderList[
                                      provider.currentWeekly]['price'] +
                                  ' USD',
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
                    );
                  }),
                  SizedBoxResponsive(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'NEW IN TOWN',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsResponsive.only(top: 20),
                            child: AutoSizeText(
                              'View all',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBoxResponsive(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 10,
                  ),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return VerticalView(
                      list: provider.verticalView,
                    );
                  }),
                  Center(
                    child: Image.asset(
                      'assets/images/homeCenter.png',
                      height: 205.5.h,
                      width: 335.14.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBoxResponsive(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'SHOP BY THE LOOK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsResponsive.only(top: 20),
                            child: AutoSizeText(
                              'View all',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBoxResponsive(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBoxResponsive(
                    height: 10,
                  ),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return VerticalView(
                      list: provider.verticalView,
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
