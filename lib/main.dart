import 'package:flutter/material.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/widgets/bottomNavigator.dart';
import 'package:provider/provider.dart';

import 'core/providers/HomeProvider.dart';
import 'core/providers/SalesProvider.dart';
import 'core/providers/bagProvider.dart';
import 'core/providers/eliteProvider.dart';
import 'core/providers/loginProvider.dart';
import 'core/providers/splashProvider.dart';
import 'core/providers/wishlistProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => BagProvider()),
        ChangeNotifierProvider(create: (_) => EliteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme(),
        home: BottomNavBar(),
      ),
    );
  }
}
