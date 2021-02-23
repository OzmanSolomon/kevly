import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class LoaderFetchingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextLiquidFill(
        text: 'Loading . . .',
        waveColor: appTheme().primaryColor,
        boxBackgroundColor: appTheme().scaffoldBackgroundColor,
        textStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Oswald',
          fontSize: ScreenUtil().setSp(30.0),
          fontWeight: FontWeight.w500,
        ),
        boxHeight: 100.0,
      ),
    );
  }
}

class OverLayWidgetWithLoader extends StatefulWidget {
  final bool added;
  OverLayWidgetWithLoader(this.added);
  @override
  _OverLayWidgetWithLoaderState createState() =>
      _OverLayWidgetWithLoaderState();
}

class _OverLayWidgetWithLoaderState extends State<OverLayWidgetWithLoader> {
  final GlobalKey<ScaffoldState> _addInfoScaffoldKey =
      GlobalKey<ScaffoldState>();
  bool watcher = false;

  void route() {
    if (widget.added != true) {
      Navigator.pop(_addInfoScaffoldKey.currentContext);
    } else {}
  }

  initiateRoute() {
    if (widget.added != true) {
      Future.delayed(Duration(seconds: 4)).then((value) => {
            if (mounted)
              {
                setState(() {
                  watcher = true;
                })
              }
          });
    }
  }

  @override
  void initState() {
    initiateRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Opacity(
        opacity: 0.55,
        child: Scaffold(
          key: _addInfoScaffoldKey,
          body: ContainerResponsive(
            color: appTheme().accentColor,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.width / 2,
                  right: 100,
                  left: 100.0,
                  child: Center(
                    child: Column(
                      children: [
                        ContainerResponsive(
                          height: 200.0,
                          width: 200.0,
                          child: Center(
                            child: SpinKitFadingCircle(
                              color: Colors.white,
                              size: 60.0,
                            ),
                          ),
                        ),
                        SizedBoxResponsive(
                          height: 15,
                        ),
                        AutoSizeText(
                          "Loading ...",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(18),
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
