import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/base/colorConvirter.dart';
import 'package:kyveli/core/providers/productDetails.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/widgets/VerticalView.dart';
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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
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
                            provider.product['status'].toUpperCase(),
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
                      height: 34,
                    ),
                    Center(
                      child: ContainerResponsive(
                        padding: EdgeInsetsResponsive.all(8),
                        width: 325,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/size.svg',
                              width: 33.28.w,
                              height: 17.h,
                            ),
                            SizedBoxResponsive(
                              width: 5,
                            ),
                            TextResponsive(
                              'Size guide',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxResponsive(
                      height: 33,
                    ),
                    Column(
                      children: [
                        sizesWidget(),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                        colorsWidget(width),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                        sortWidget(width),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                        Center(
                          child: ContainerResponsive(
                            padding: EdgeInsetsResponsive.all(8),
                            width: 325,
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextResponsive(
                                  'ADD',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBoxResponsive(
                          height: 17,
                        ),
                      ],
                    ),
                    SizedBoxResponsive(
                      height: 17,
                    ),
                    Consumer<ProductDetialsProvider>(
                        builder: (context, provider, child) {
                      return VerticalView(
                        list: provider.product['suggestions'],
                        showAddToBagButton: true,
                      );
                    })
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Column colorsWidget(width) {
    return Column(
      children: [
        Row(
          children: [
            SizedBoxResponsive(
              width: 25,
            ),
            TextResponsive(
              'ITEM Color'.toUpperCase(),
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
        Container(
          width: width,
          child: Consumer<ProductDetialsProvider>(
              builder: (context, provider, child) {
            List colorsList = provider.product['attrbute']['colors'];

            return GridView.builder(
                itemCount: colorsList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1, crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = provider.selectedColor != null
                      ? provider.selectedColor['value'] ==
                              colorsList[index]['value']
                          ? true
                          : false
                      : false;
                  return GestureDetector(
                    onTap: () =>
                        provider.onSelectColor(color: colorsList[index]),
                    child: Container(
                      width: 38,
                      height: 38,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(
                            color: isSelected
                                ? colorsList[index]['value']
                                            .toString()
                                            .toUpperCase() ==
                                        '#FFFFFF'
                                    ? Colors.black
                                    : HexColor(colorsList[index]['value'])
                                : Colors.transparent,
                            width: 2),
                      ),
                      child: Container(
                        width: 33,
                        height: 33,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: HexColor(colorsList[index]['value']),
                            borderRadius: BorderRadius.circular(360),
                            border: Border.all(
                                color: colorsList[index]['value']
                                            .toString()
                                            .toUpperCase() ==
                                        '#FFFFFF'
                                    ? Colors.black
                                    : HexColor(colorsList[index]['value']),
                                width: 2)),
                        child: isSelected
                            ? SvgPicture.asset(
                                'assets/images/correct.svg',
                                color: colorsList[index]['value']
                                            .toString()
                                            .toUpperCase() ==
                                        '#FFFFFF'
                                    ? Colors.black
                                    : Colors.white,
                                width: 11.58.w,
                                height: 10.h,
                              )
                            : Container(),
                      ),
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
              'ITEM Size'.toUpperCase(),
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
          child: Consumer<ProductDetialsProvider>(
              builder: (context, provider, child) {
            List sizesList = provider.product['attrbute']['sizes'];
            return GridView.builder(
                itemCount: sizesList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1, crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = provider.selectedSize != null
                      ? provider.selectedSize['value'] ==
                              sizesList[index]['value']
                          ? true
                          : false
                      : false;
                  return GestureDetector(
                    onTap: () => provider.onSelectSize(size: sizesList[index]),
                    child: Container(
                      height: 33,
                      width: 33,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(360),
                          border: Border.all(color: Colors.black, width: 1)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextResponsive(
                            sizesList[index]['lable'],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 13,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }

  Column sortWidget(width) {
    return Column(
      children: [
        Row(
          children: [
            SizedBoxResponsive(
              width: 25,
            ),
            TextResponsive(
              'Quantity'.toUpperCase(),
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
          child: Consumer<ProductDetialsProvider>(
              builder: (context, provider, child) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () => provider.decreaseQuantity(),
                  child: Container(
                    height: 33,
                    width: 33,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.black, width: 1)),
                    alignment: Alignment.center,
                    child: TextResponsive(
                      '-',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                TextResponsive(
                  '${provider.quantity}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w300),
                ),
                GestureDetector(
                  onTap: () => provider.increaseQuantity(),
                  child: Container(
                    height: 33,
                    width: 33,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.black, width: 1)),
                    alignment: Alignment.center,
                    child: TextResponsive(
                      '+',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                TextResponsive(
                  '( \$${provider.total} USD )',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color(0xff8D8D8D),
                      fontSize: 15,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w300),
                ),
              ],
            );
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
