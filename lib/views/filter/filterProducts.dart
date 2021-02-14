import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/filterProductsProvider.dart';
import 'package:kyveli/widgets/VerticalView.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class FilterProducts extends StatefulWidget {
  final List productList;
  FilterProducts({@required this.productList});
  @override
  _FilterProductsState createState() => _FilterProductsState();
}

class _FilterProductsState extends State<FilterProducts> {
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
        key: Provider.of<FilterProductsProvider>(context, listen: false)
            .scaffoldKey,
        appBar: CustomAppbar(
          productList: [],
          title: 'Filter',
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: Provider.of<FilterProductsProvider>(context, listen: false)
                    .formKey,
                child: Column(children: <Widget>[
                  Consumer<FilterProductsProvider>(
                      builder: (context, provider, child) {
                    return VerticalView(
                      list: widget.productList,
                    );
                  }),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
