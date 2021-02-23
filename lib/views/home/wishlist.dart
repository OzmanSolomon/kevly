import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/wishlist.dart';
import 'package:kyveli/widgets/VerticalView.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    super.initState();
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
          productList: Provider.of<WishlistProvider>(context, listen: false)
              .verticalView,
          title: 'WISHLIST',
          isBackButton: false,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Consumer<WishlistProvider>(builder: (context, model, child) {
                  return VerticalView(
                    list: model.verticalView,
                    showAddToBagButton: true,
                  );
                }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
