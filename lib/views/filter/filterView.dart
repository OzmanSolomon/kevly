import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/base/colorConvirter.dart';
import 'package:kyveli/core/providers/filterProvider.dart';
import 'package:kyveli/widgets/customButton.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class FilterView extends StatefulWidget {
  final List productList;
  FilterView({@required this.productList});
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
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
        appBar: FilterViewAppBar(),
        key: Provider.of<FilterProvider>(context, listen: false).scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: Provider.of<FilterProvider>(context, listen: false).formKey,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBoxResponsive(
                        height: 45,
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
                                  fontSize: ScreenUtil().setSp(17),
                                  onPressed: () {
                                    provider.applyFilter(
                                        widget.productList, context);
                                  },
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
            AutoSizeText(
              'Color',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(15),
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
                        ContainerResponsive(
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
                        AutoSizeText(
                          provider.colors[index]['lable'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Color(0xff666E74),
                              fontSize: ScreenUtil().setSp(13),
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
                            : ContainerResponsive()
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
            AutoSizeText(
              'Size',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(15),
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
                        AutoSizeText(
                          provider.sizes[index]['lable'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Color(0xff666E74),
                              fontSize: ScreenUtil().setSp(13),
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
                            : ContainerResponsive()
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
            AutoSizeText(
              'SORT BY',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(15),
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
                        AutoSizeText(
                          provider.sort[index]['lable'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Color(0xff666E74),
                              fontSize: ScreenUtil().setSp(13),
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
                            : ContainerResponsive()
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

class FilterViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FilterViewAppBar({
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
                width: 25.w,
                height: 25.h,
              ),
            ),
          ),
          AutoSizeText(
            'Filter',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(17),
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () =>
                Provider.of<FilterProvider>(context, listen: false).onClear(),
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
        ],
      ),
    );
  }
}
