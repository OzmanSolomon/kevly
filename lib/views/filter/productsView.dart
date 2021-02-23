import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyveli/widgets/VerticalView.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ProductsView extends StatefulWidget {
  final String title;
  final List productList;
  ProductsView({@required this.productList, @required this.title});
  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
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
        appBar: CustomAppbar(
          productList: [],
          hideFilter: true,
          title: widget.title,
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                widget.productList.isNotEmpty
                    ? VerticalView(
                        list: widget.productList,
                      )
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
                      ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
