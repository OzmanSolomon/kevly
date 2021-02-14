import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/collectionProductsProvider.dart';
import 'package:kyveli/widgets/VerticalView.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CollectionProduct extends StatefulWidget {
  final String title;
  CollectionProduct({@required this.title});
  @override
  _CollectionProductState createState() => _CollectionProductState();
}

class _CollectionProductState extends State<CollectionProduct> {
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
        key: Provider.of<CollectionProductsProvider>(context, listen: false)
            .scaffoldKey,
        appBar: CustomAppbar(
          productList:
              Provider.of<CollectionProductsProvider>(context, listen: false)
                  .verticalView,
          title: widget.title,
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: Provider.of<CollectionProductsProvider>(context,
                        listen: false)
                    .formKey,
                child: Column(children: <Widget>[
                  Consumer<CollectionProductsProvider>(
                      builder: (context, provider, child) {
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
