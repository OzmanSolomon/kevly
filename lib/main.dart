import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyveli/core/providers/HomeProvider.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/core/providers/drawerProvider.dart';
import 'package:kyveli/core/providers/eliteProvider.dart';
import 'package:kyveli/core/providers/loginProvider.dart';
import 'package:kyveli/core/providers/splashProvider.dart';
import 'package:kyveli/core/providers/wishlist.dart';
import 'package:kyveli/core/providers/SalesProvider.dart';
import 'package:kyveli/core/providers/filterProvider.dart';
import 'package:kyveli/theme/appTheme.dart';

import 'package:kyveli/widgets/bottomNavigator.dart';
import 'package:provider/provider.dart';
import 'core/providers/collectionProductsProvider.dart';
import 'core/providers/bottomNavProvider.dart';
import 'core/providers/collectionProvider.dart';
import 'core/providers/filterProductsProvider.dart';
import 'core/providers/productDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetialsProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => CollectionProductsProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => CollectionProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => FilterProductsProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => BagProvider()),
        ChangeNotifierProvider(create: (_) => EliteProvider()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kyveli',
          theme: appTheme(),
          home: BottomNavBar(),
        ),
      ),
    );
  }
}
