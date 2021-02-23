import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/EliteProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Elite extends StatefulWidget {
  @override
  _EliteState createState() => _EliteState();
}

class _EliteState extends State<Elite> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  void nav(context) async {
    Provider.of<EliteProvider>(context, listen: false).navigationPage(context);
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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[]),
          ),
        ),
      ),
    );
  }
}
