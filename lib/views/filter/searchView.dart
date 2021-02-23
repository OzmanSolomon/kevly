import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyveli/core/providers/searchProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class SearchView extends StatefulWidget {
  final List products;
  SearchView(this.products);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false)
          .searchController
          .clear();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
        appBar: SearchViewAppBar(
          products: widget.products,
          width: width,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBoxResponsive(
                      height: 45,
                    ),
                    AutoSizeText(
                      'TRENDS',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          color: Colors.black,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400),
                    ),
                    Consumer<SearchProvider>(
                        builder: (context, provider, child) {
                      return ListView.builder(
                          itemCount: provider.trendSearchs.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: GestureDetector(
                                  onTap: () => provider.applySearch(
                                      widget.products,
                                      provider.trendSearchs[index],
                                      context),
                                  child: AutoSizeText(
                                    provider.trendSearchs[index],
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(15),
                                        color: Colors.black,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                    SizedBoxResponsive(
                      height: 58,
                    ),
                    Provider.of<SearchProvider>(context, listen: false)
                            .recentSearchs
                            .isNotEmpty
                        ? AutoSizeText(
                            'RECENT',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                color: Colors.black,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          )
                        : ContainerResponsive(),
                    Consumer<SearchProvider>(
                        builder: (context, provider, child) {
                      return ListView.builder(
                          itemCount: provider.recentSearchs.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: GestureDetector(
                                  onTap: () => provider.applySearch(
                                      widget.products,
                                      provider.recentSearchs[index],
                                      context),
                                  child: AutoSizeText(
                                    provider.recentSearchs[index],
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(15),
                                        color: Colors.black,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                    SizedBoxResponsive(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Provider.of<SearchProvider>(context, listen: false)
                              .clearHistory(),
                      child: AutoSizeText(
                        'CLEAR HISTORY',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.black,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w400),
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

class SearchViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double width;
  final List products;
  SearchViewAppBar({
    this.width,
    this.products,
  });
  @override
  Size get preferredSize => Size.fromHeight(44.h);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsResponsive.only(
        top: 40,
        left: 20.0,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/images/cross.svg',
                width: 25.w,
                height: 25.h,
              ),
            ),
          ),
          Consumer<SearchProvider>(builder: (context, provider, child) {
            return ContainerResponsive(
                height: 30,
                width: width - 80,
                child: TextFormField(
                  controller: provider.searchController,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (s) => provider.applySearch(
                      products, provider.searchController.text, context),
                  decoration: new InputDecoration(
                      hintText: 'Search ...',
                      hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.black,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w100)),
                ));
          })
        ],
      ),
    );
  }
}
