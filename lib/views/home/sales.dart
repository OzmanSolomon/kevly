import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/SalesProvider.dart';
import 'package:kyveli/widgets/VerticalView.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
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
        key: Provider.of<SalesProvider>(context, listen: false).scaffoldKey,
        appBar: CustomAppbar(
          productList:
              Provider.of<SalesProvider>(context, listen: false).verticalView,
          title: 'SALE',
          isBackButton: false,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: Provider.of<SalesProvider>(context, listen: false).formKey,
                child: Column(children: <Widget>[
                  Consumer<SalesProvider>(builder: (context, provider, child) {
                    return VerticalView(
                      list: provider.verticalView,
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
