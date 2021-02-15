import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/base/colorConvirter.dart';
import 'package:kyveli/core/providers/filterProvider.dart';
import 'package:kyveli/core/providers/productDetails.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/widgets/customButton.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Provider.of<ProductDetialsProvider>(context, listen: false)
        .setSlider(width);
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
        key: Provider.of<FilterProvider>(context, listen: false).scaffoldKey,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: Provider.of<FilterProvider>(context, listen: false).formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: [
                        Provider.of<ProductDetialsProvider>(context,
                                        listen: false)
                                    .imageSliders !=
                                null
                            ? Consumer<ProductDetialsProvider>(
                                builder: (context, provider, child) {
                                return CarouselSlider(
                                  items: provider.imageSliders,
                                  options: CarouselOptions(
                                      scrollDirection: Axis.vertical,
                                      enlargeCenterPage: true,
                                      aspectRatio: width / 480,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          provider.current = index;
                                        });
                                      }),
                                );
                              })
                            : Container(),
                        Positioned(
                          right: 26,
                          top: 480 / 2,
                          child: Consumer<ProductDetialsProvider>(
                              builder: (context, provider, child) {
                            List<String> myList =
                                provider.product['silder_images'];

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: myList.map((url) {
                                int index = myList.indexOf(url);
                                return Container(
                                  padding: EdgeInsetsResponsive.all(8),
                                  margin: EdgeInsetsResponsive.all(4),
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: provider.current == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(360),
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                        ),
                        ProductDetailsAppBar(),
                      ],
                    ),
                    SizedBoxResponsive(
                      height: 13,
                    ),
                    Consumer<ProductDetialsProvider>(
                        builder: (context, provider, child) {
                      return Row(
                        children: [
                          SizedBoxResponsive(
                            width: 25,
                          ),
                          TextResponsive(
                            provider.product['status'],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color(0xff11AA6F),
                                fontSize: 12,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      );
                    }),
                    SizedBoxResponsive(
                      height: 13,
                    ),
                    Consumer<ProductDetialsProvider>(
                        builder: (context, provider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBoxResponsive(
                                width: 25,
                              ),
                              SizedBoxResponsive(
                                width: 172,
                                child: TextResponsive(
                                  provider.product['name'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBoxResponsive(
                                    width: 20,
                                  ),
                                  TextResponsive(
                                    '\$' +
                                        provider.product['discount'] +
                                        ' USD',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBoxResponsive(
                                    width: 5,
                                  ),
                                  TextResponsive(
                                    '\$' + provider.product['price'] + ' USD',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: appTheme().accentColor,
                                        fontSize: 14,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              SizedBoxResponsive(
                                width: 25,
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                    Consumer<ProductDetialsProvider>(
                        builder: (context, provider, child) {
                      return Row(
                        children: [
                          SizedBoxResponsive(
                            width: 25,
                          ),
                          SizedBoxResponsive(
                            width: 216,
                            child: TextResponsive(
                              provider.product['disc'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBoxResponsive(
                      height: 33,
                    ),
                    Column(
                      children: [
                        colorsWidget(),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                        sizesWidget(),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                        sortWidget(),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsResponsive.only(bottom: 36.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ContainerResponsive(
                            width: 325,
                            height: 50,
                            child: Consumer<FilterProvider>(
                                builder: (context, provider, child) {
                              return CustomRaisedButton(
                                fontColor: Color(0xffFFFFFF),
                                fontFamily: 'GeDinarOne_Medium',
                                fontSize: 17,
                                onPressed: () {},
                                title: 'Done',
                              );
                            })),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Column colorsWidget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBoxResponsive(
              width: 25,
            ),
            TextResponsive(
              'Color',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBoxResponsive(
          height: 17,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: Consumer<FilterProvider>(builder: (context, provider, child) {
            return GridView.builder(
                itemCount: provider.colors.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 60 / 20, crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = provider.selectedColor != null
                      ? provider.selectedColor['value'] ==
                              provider.colors[index]['value']
                          ? true
                          : false
                      : false;
                  return GestureDetector(
                    onTap: () =>
                        provider.onSelectColor(color: provider.colors[index]),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsetsResponsive.all(8),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: HexColor(provider.colors[index]['value']),
                              borderRadius: BorderRadius.circular(360),
                              border: Border.all(
                                  color: provider.colors[index]['value']
                                              .toString()
                                              .toUpperCase() ==
                                          '#FFFFFF'
                                      ? Colors.black
                                      : HexColor(
                                          provider.colors[index]['value']),
                                  width: 2)),
                        ),
                        SizedBoxResponsive(
                          width: 10,
                        ),
                        TextResponsive(
                          provider.colors[index]['lable'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Color(0xff666E74),
                              fontSize: 13,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBoxResponsive(
                          width: 10,
                        ),
                        isSelected
                            ? SvgPicture.asset(
                                'assets/images/correct.svg',
                                width: 11.58.w,
                                height: 10.h,
                              )
                            : Container()
                      ],
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }

  Column sizesWidget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBoxResponsive(
              width: 25,
            ),
            TextResponsive(
              'Size',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBoxResponsive(
          height: 17,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: Consumer<FilterProvider>(builder: (context, provider, child) {
            return GridView.builder(
                itemCount: provider.sizes.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 60 / 20, crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = provider.selectedSize != null
                      ? provider.selectedSize['value'] ==
                              provider.sizes[index]['value']
                          ? true
                          : false
                      : false;
                  return GestureDetector(
                    onTap: () =>
                        provider.onSelectSize(size: provider.sizes[index]),
                    child: Row(
                      children: [
                        TextResponsive(
                          provider.sizes[index]['lable'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Color(0xff666E74),
                              fontSize: 13,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBoxResponsive(
                          width: 10,
                        ),
                        isSelected
                            ? SvgPicture.asset(
                                'assets/images/correct.svg',
                                width: 11.58.w,
                                height: 10.h,
                              )
                            : Container()
                      ],
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }

  Column sortWidget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBoxResponsive(
              width: 25,
            ),
            TextResponsive(
              'SORT BY',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBoxResponsive(
          height: 17,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: Consumer<FilterProvider>(builder: (context, provider, child) {
            return GridView.builder(
                itemCount: provider.sort.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 60 / 20, crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = provider.selectedSort != null
                      ? provider.selectedSort['value'] ==
                              provider.sort[index]['value']
                          ? true
                          : false
                      : false;
                  return GestureDetector(
                    onTap: () =>
                        provider.onSelectSort(sort: provider.sort[index]),
                    child: Row(
                      children: [
                        TextResponsive(
                          provider.sort[index]['lable'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Color(0xff666E74),
                              fontSize: 13,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBoxResponsive(
                          width: 10,
                        ),
                        isSelected
                            ? SvgPicture.asset(
                                'assets/images/correct.svg',
                                width: 11.58.w,
                                height: 10.h,
                              )
                            : Container()
                      ],
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }
}

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppBar({
    Key key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(44.h);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsResponsive.only(
        top: 20,
        left: 20.0,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/images/cross.svg',
                width: 18,
                height: 18,
              ),
            ),
          ),
          GestureDetector(
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
        ],
      ),
    );
  }
}
